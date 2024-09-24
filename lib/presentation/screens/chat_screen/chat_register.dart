import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class ChatRegister extends StatefulWidget {
  const ChatRegister({Key? key}) : super(key: key);

  @override
  State<ChatRegister> createState() => _ChatRegisterState();
}

final GlobalKey<FormState> _chatkey = GlobalKey<FormState>();

bool isLoading = false;

String? chatEmail;
String? chatPassword;

class _ChatRegisterState extends State<ChatRegister> {
  bool _ishidenPassword = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Material(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Chats",
              style: TextStyle(
                  fontSize: 25, fontFamily: "JF-Flat", color: Colors.black),
            ),
            backgroundColor: Colors.white,
            centerTitle: true,
            elevation: 0.0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Form(
            key: _chatkey,
            child: ListView(
              children: [
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: SvgPicture.asset(
                          "assets/images/messages.svg",
                          height: 180,
                          width: 200,
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          onChanged: (data) {
                            chatEmail = data;
                          },
                          validator: validateEmail,
                          decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle: const TextStyle(
                                  fontSize: 20, fontFamily: "JF-Flat"),
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: Colors.blueGrey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: TextFormField(
                          onChanged: (data) {
                            chatPassword = data;
                          },
                          validator: validatepassword,
                          obscureText: _ishidenPassword,
                          decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: const TextStyle(
                                  fontSize: 20, fontFamily: "JF-Flat"),
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.blueGrey,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _ishidenPassword = !_ishidenPassword;
                                  });
                                },
                                icon: Icon(
                                  _ishidenPassword
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility,
                                ),
                                color: Colors.blueGrey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      isLoading == true
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                      // primary: Colors.redAccent,
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 70,
                                          right: 70)),
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(
                                        fontFamily: "JF-Flat",
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () async {
                                    if (_chatkey.currentState!.validate()) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      try {
                                        await chatRegister();
                                        // ignore: use_build_context_synchronously
                                        Navigator.pushNamed(
                                            context, 'ChatLogin');
                                        // ignore: use_build_context_synchronously
                                        showSnackBar(context, " Success");
                                      } on FirebaseAuthException catch (ex) {
                                        if (ex.code == "Weak Password") {
                                          showSnackBar(
                                              context, "Weak Password");
                                        } else if (ex.code ==
                                            "Email is already in use") {
                                          showSnackBar(context,
                                              "Email is already in use");
                                        }
                                      } catch (ex) {
                                        showSnackBar(
                                            context, "There is an error");
                                      }

                                      setState(() {
                                        isLoading = false;
                                      });
                                    }
                                  }),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account? "),
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Login ",
                                style: TextStyle(color: Colors.redAccent),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String messageSnackBar) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(messageSnackBar)));
  }

  Future<void> chatRegister() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: chatEmail!, password: chatPassword!);
  }

  String? validateEmail(String? fromEmail) {
    if (fromEmail == null || fromEmail.isEmpty) {
      return "E-mail address is required * ";
    }

    // String pattern = r'\w+\@\w+\.w+';
    // RegExp regExp = RegExp(pattern);
    // if (!regExp.hasMatch(fromEmail)) {
    //   return "Invaild E-mail address format * ";
    // }
    else {
      return null;
    }
  }

  String? validatepassword(String? frompassword) {
    if (frompassword == null || frompassword.isEmpty) {
      return "Password is required *";
    }
    // String pattern =
    //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$';
    // RegExp regex = RegExp(pattern);
    // if (!regex.hasMatch(frompassword)) {
    //   return " Password must be at least 6 characters,"
    //   "include an uppercase letter, number and symbol. ";

    // }
    else {
      return null;
    }
  }
}
