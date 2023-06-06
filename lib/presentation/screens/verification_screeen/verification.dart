import 'package:flutter/material.dart';
import 'package:flutter_application_1/presentation/screens/app_layout/app_layout.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../verification login_screen/verificationLogin.dart';

class Verification extends StatefulWidget {
  final String phone;
  // ignore: use_key_in_widget_constructors
  const Verification(
    this.phone,
  );

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  bool unvisable = false;

  VerificationLogin phoneNum = const VerificationLogin();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
          body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, left: 2, right: 360),
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
            padding:
                const EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 15),
            child: const Center(
              child: Text(
                "Verification",
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 30,
                    fontFamily: "JF-Flat",
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                  left: 30,
                  right: 30,
                ),
                child: Center(
                  child: Text(
                    // ignore: prefer_interpolation_to_compose_strings
                    "Verify num .. ${" " + widget.phone}",
                    style: const TextStyle(
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontFamily: "JF-Flat"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),

              SvgPicture.asset("assets/images/verification.svg",
                  height: 200, allowDrawingOutsideViewBox: true),
              /////////////////////********************* */
              const SizedBox(
                height: 20,
              ),

              OtpTextField(
                fieldWidth: 50,
                borderRadius: BorderRadius.circular(15),
                numberOfFields: 6,
                borderColor: const Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,

                //runs when a code is typed in
                onCodeChanged: (code) {},
                //runs when every textfield is filled
                onSubmit: (verificationCode) {
                  // Navigator.of(context).pushNamed("Reset Password");

                  if (verificationCode.characters == false) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            title: Text(
                              "Verification Code is not valid :(",
                              style: TextStyle(
                                  fontFamily: "JF-Flat",
                                  fontSize: 18,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            content: Text(
                              'Please check the confirmation number that was sent to you, or perform the operation again :) ',
                              style: TextStyle(
                                  fontFamily: "JF-Flat", fontSize: 15),
                            ),
                          );
                        });
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AppLayout(),
                        ));
                  }
                }, // end onSubmit
              ),
              Container(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const VerificationLogin(),
                      ));
                    },
                    child: const Text(
                      "Resend code?",
                      style: TextStyle(
                        fontFamily: "JF-Flat",
                        fontSize: 20,
                        color: Colors.redAccent,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )),
            ],
          ),
        ],
      )),
    );
  }

  String? validateVerifyCode(String? code) {
    if (code == null || code.isEmpty || code.indexOf(code) == false) {
      return code;
    }
  }
}
