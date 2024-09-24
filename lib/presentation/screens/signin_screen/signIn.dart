import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Home_App/home_App.dart';

class SignIn extends StatefulWidget {
  const SignIn({required key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _civilIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _signInKey = GlobalKey<FormState>();
  bool hidenPassword = true;
  bool ishidenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: ListView(children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 15, left: 2, right: 360),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_outlined,
                size: 27,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30),
            child: const Center(
              child: Text(
                "Sign In",
                style: TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 27,
                    fontFamily: "JF-Flat",
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
              key: _signInKey,
              child: Column(children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 30),
                      label: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 9),
                        child: const Text(
                          "First Name",
                          style: TextStyle(fontFamily: "JF-Flat", fontSize: 18),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: const Icon(
                        Icons.person_outline,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 30),
                          label: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 9),
                            child: const Text(
                              "Last Name",
                              style: TextStyle(
                                  fontFamily: "JF-Flat", fontSize: 18),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: Colors.blueGrey,
                          ),
                        ))),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 2, horizontal: 30),
                          label: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 9),
                            child: const Text(
                              "Email",
                              style: TextStyle(
                                  fontFamily: "JF-Flat", fontSize: 18),
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.blueGrey,
                          ),
                        ))),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 30),
                        label: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 9),
                          child: const Text(
                            "Mobile Number",
                            style:
                                TextStyle(fontFamily: "JF-Flat", fontSize: 18),
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        prefixIcon: const Icon(
                          Icons.call_outlined,
                          color: Colors.blueGrey,
                        ),
                      ),
                      maxLength: 11,
                      keyboardType: TextInputType.number,
                    )),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      controller: _civilIdController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 30),
                        label: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 9),
                          child: const Text(
                            "Civil Id",
                            style:
                                TextStyle(fontFamily: "JF-Flat", fontSize: 18),
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        prefixIcon: const Icon(
                          Icons.featured_play_list_outlined,
                          color: Colors.blueGrey,
                        ),
                      ),
                      maxLength: 14,
                      keyboardType: TextInputType.number,
                    )),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                        controller: _passwordController,
                        obscureText: hidenPassword,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 30),
                            label: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 9),
                              child: const Text(
                                "Password",
                                style: TextStyle(
                                    fontFamily: "JF-Flat", fontSize: 18),
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: const Icon(
                              Icons.vpn_key_outlined,
                              color: Colors.blueGrey,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidenPassword = !hidenPassword;
                                });
                              },
                              icon: Icon(
                                hidenPassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.blueGrey,
                              ),
                            )))),
                const SizedBox(
                  height: 15,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                        controller: _confirmPasswordController,
                        obscureText: ishidenPassword,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 30),
                            label: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 9),
                              child: const Text(
                                "Confirm Password",
                                style: TextStyle(
                                    fontFamily: "JF-Flat", fontSize: 18),
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            prefixIcon: const Icon(
                              Icons.vpn_key_outlined,
                              color: Colors.blueGrey,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  ishidenPassword = !ishidenPassword;
                                });
                              },
                              icon: Icon(
                                ishidenPassword
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.blueGrey,
                              ),
                            )))),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 10),
                      ),
                      child: const Text(
                        "Create an account",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontFamily: "JF-Flat"),
                      ),
                      onPressed: () async {
                        if (_signInKey.currentState!.validate()) {
                          var result = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text);

                          // ignore: unnecessary_null_comparison
                          if (result != null) {
                            FirebaseFirestore.instance
                                .collection("users")
                                .doc(result.user!.uid)
                                .set({
                              "first name": _firstNameController.text,
                              "last name": _lastNameController.text,
                              "email": _emailController.text,
                              "mobile number": _phoneController.text,
                              "civil id": _civilIdController.text,
                              "password": _passwordController.text,
                              "confirm password":
                                  _confirmPasswordController.text
                            });
                          } else {
                            print("Occure error");
                          }
                          // ignore: use_build_context_synchronously
                          showSnackBar(context, " Registration is Success");
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Home(),
                              ));
                        }
                      },
                    ),
                  ),
                ),
              ]))
        ]),
      ),
    );
  }

  void showSnackBar(BuildContext context, String messageSnackBar) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(messageSnackBar)));
  }
}
