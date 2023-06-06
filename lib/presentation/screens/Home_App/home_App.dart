import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../business_logic/detection_model/detection_cubit.dart';
import '../../../business_logic/detection_model/detection_state.dart';
import '../chat_screen/chat_home_screen.dart';
import '../chat_screen/chat_login_screen.dart';
import '../chat_screen/chat_register.dart';
import '../login by any account screen/loginByAnyAccount.dart';
import '../login_screen/login.dart';
import '../reset_password_screen/resetPassword.dart';
import '../signin_screen/signIn.dart';
import '../signup_screen/signup.dart';
import '../verification login_screen/verificationLogin.dart';

// ignore: use_key_in_widget_constructors
class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

// bool iconTheme = false;
// IconData iconLight = Icons.wb_sunny_outlined;
// IconData iconDark = Icons.nights_stay_outlined;
// ThemeData lightTheme = ThemeData(brightness: Brightness.light);
// ThemeData darkTheme = ThemeData(brightness: Brightness.dark);

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: MaterialApp(
              // ignore: dead_code
              // theme: iconTheme ? darkTheme : lightTheme,
              debugShowCheckedModeBanner: false,
              home: Directionality(
                textDirection: TextDirection.ltr,
                child: Scaffold(
                  body: Material(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        const SizedBox(
                          height: 20,
                          width: double.infinity,
                        ),
                        // Container(
                        //   margin: const EdgeInsets.only(left: 340, right: 20),
                        //   child: IconButton(
                        //       onPressed: () {
                        //         setState(() {
                        //           iconTheme = !iconTheme;
                        //         });
                        //       },
                        //       // ignore: dead_code
                        //       icon: Icon(iconTheme ? iconDark : iconLight)),
                        // ),
                        Container(
                          padding: const EdgeInsets.only(
                            top: 50,
                          ),
                          child: const Center(
                              child: Text(
                            "Doctor Assistant System",
                            style: TextStyle(
                                fontFamily: "JF-Flat",
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 10, left: 40, right: 40, bottom: 10),
                          child: const Center(
                              child: Text(
                            "To detection Brain tumors.",
                            style: TextStyle(
                              fontFamily: "JF-Flat",
                              fontSize: 17,
                              fontWeight: FontWeight.normal,
                            ),
                          )),
                        ),

                        const SizedBox(
                          height: 30,
                        ),
                        SvgPicture.asset(
                          "assets/images/medical_image1.svg",
                          height: 170,
                        ),

                        // ignore: prefer_const_constructors
                        Login(
                          key: null,
                        ),
                        SignUp(),
                        // ignore: prefer_const_constructors
                        LoginByAnyAccount(
                          key: null,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              routes: {
                //"Home page": (context) => const HomePage(key: null),
                "Sign In Page": (context) => const SignIn(key: null),
                "Verify Login": (context) => const VerificationLogin(),
                // "Verification" : (context) => Verification(controller.text),
                "Reset Password": (context) => const ResetPassword(key: null),
                "ChatHome": (context) => const ChatHome(),
                'ChatLogin': (context) => const ChatLogin(),
                'ChatRegister': (context) => const ChatRegister(),
              },
            ),
          );
        });
  }
}
