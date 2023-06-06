import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/presentation/screens/chat_screen/chat_register.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatLogin extends StatefulWidget {
  const ChatLogin({Key? key}) : super(key: key);

  @override
  State<ChatLogin> createState() => _ChatLoginState();
}

final GlobalKey<FormState> _chatkey = GlobalKey<FormState>();

bool isLoading = false;

String? chatEmail;
String? chatPassword;

class _ChatLoginState extends State<ChatLogin> {
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
                                      primary: Colors.redAccent,
                                      padding: const EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          left: 70,
                                          right: 70)),
                                  child: const Text(
                                    "Login",
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
                                        await chatLogin();
                                        // ignore: use_build_context_synchronously
                                        Navigator.pushNamed(context, 'ChatHome',
                                            arguments: chatEmail);
                                        // ignore: use_build_context_synchronously
                                        // showSnackBar(context, " Success");
                                      } on FirebaseAuthException catch (ex) {
                                        if (ex.code == "User not found") {
                                          showSnackBar(
                                              context, "User not found");
                                        } else if (ex.code ==
                                            "Wrong-Password") {
                                          showSnackBar(
                                              context, "Wrong-Password");
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
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ChatRegister(),
                                    ));
                              },
                              child: const Text(
                                "Register ",
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

  Future<void> chatLogin() async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: chatEmail!, password: chatPassword!);
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
