import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _supportsController = TextEditingController();
  final GlobalKey<FormState> _supportKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Support",
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _supportKey,
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    validator: validateName,
                    // onChanged: (valueOfName) {
                    //   valueOfName = _nameController.text;
                    //   _nameController.clear();
                    // },
                    controller: _nameController,
                    decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 236, 233, 233),
                        label: const Text(
                          "Name",
                          style: TextStyle(fontSize: 20, fontFamily: "JF-Flat"),
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
                          size: 20,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    validator: validateEmail,
                    // onChanged: (valueOfEmail) {
                    //   valueOfEmail = _nameController.text;
                    //   _emailController.clear();
                    // },
                    controller: _emailController,
                    decoration: InputDecoration(
                        label: const Text(
                          "E-mail",
                          style: TextStyle(fontSize: 20, fontFamily: "JF-Flat"),
                        ),
                        prefixIcon: const Icon(
                          Icons.email,
                          size: 20,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    validator: validateHelpAndSupport,
                    // onChanged: (valueOfSupport) {
                    //   valueOfSupport = _supportsController.text;
                    //   _supportsController.clear();
                    // },
                    controller: _supportsController,
                    maxLines: 10,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        labelText: "Are you any Suggetions or Problems ?",
                        labelStyle: const TextStyle(fontFamily: "JF-Flat"),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_supportKey.currentState!.validate()) {
                          var result = FirebaseAuth.instance;

                          // ignore: unnecessary_null_comparison
                          if (result != null) {
                            FirebaseFirestore.instance
                                .collection("Help and Supports")
                                .doc(result.currentUser!.uid)
                                .set({
                              'name': _nameController.text,
                              'email': _emailController.text,
                              'supports': _supportsController.text,
                            });
                            showSnackBar(
                                context, 'Suggestions or Problems are send');
                          }
                        }
                        _nameController.clear();
                        _emailController.clear();
                        _supportsController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: const EdgeInsets.only(
                              left: 40, right: 40, top: 10, bottom: 10)),
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 20, fontFamily: "JF-Flat",color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String messageSnackBar) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(messageSnackBar)));
  }

  // Validate For Form
  String? validateName(String? fromName) {
    if (fromName == null || fromName.isEmpty) {
      return "Personal Name is required * ";
    } else {
      return null;
    }
  }

  String? validateEmail(String? fromEmail) {
    if (fromEmail == null || fromEmail.isEmpty) {
      return "E-Mail is required *";
    } else {
      return null;
    }
  }

  String? validateHelpAndSupport(String? fromSuggetionsAndProblems) {
    if (fromSuggetionsAndProblems == null ||
        fromSuggetionsAndProblems.isEmpty) {
      return " Suggetions And Problems are required *";
    } else {
      return null;
    }
  }
}
