import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../app_layout/app_layout.dart';
import '../verification login_screen/verificationLogin.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _ishidenPassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  bool isLoading = false;
  // String errorMassage = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Form(
        key: _loginKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: emailController,
                validator: validateEmail,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  label: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text(
                        "Email",
                        style: TextStyle(fontFamily: "JF-Flat", fontSize: 18),
                      )),
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                    controller: passwordController,
                    validator: validatepassword,
                    obscureText: _ishidenPassword,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 30),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      label: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Text(
                            "Password",
                            style:
                                TextStyle(fontFamily: "JF-Flat", fontSize: 18),
                          )),
                      prefixIcon: const Icon(
                        Icons.lock_clock_outlined,
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
                              : Icons.visibility_outlined,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ))),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              child: Container(
                margin: const EdgeInsets.only(left: 10),
                child: const Text(
                  "Forget Password !",
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontFamily: "JF-Flat"),
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const VerificationLogin(),
                ));
              },
            ),
            const SizedBox(
              height: 10,
            ),
            isLoading == true
                ? const Center(child: CircularProgressIndicator())
                : Container(
                    padding: const EdgeInsets.only(left: 135, right: 60),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                            // primary: Colors.deepPurple,
                            padding: const EdgeInsets.only(
                                left: 40, right: 40, top: 10, bottom: 10)),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontFamily: "JF-Flat"),
                        ),
                        onPressed: () async {
                          if (_loginKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });

                            try {
                              var credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: emailController.text,
                                      password: passwordController.text);

                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const AppLayout(key: null),
                              ));
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                showSnackBar(context, "User not found");
                                print('No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                showSnackBar(context, "Wrong Password");
                                print('Wrong password provided for that user.');
                              }
                              // const CircularProgressIndicator();
                              // isLoading = false;
                              // setState(() {});
                            } catch (ex) {
                              showSnackBar(context, "There is an error");
                            }

                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                      ),
                    ),
                  ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String messageSnackBar) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(messageSnackBar)));
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
