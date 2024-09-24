import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:country_code_picker/country_code_picker.dart';
import '../verification_screeen/verification.dart';

class VerificationLogin extends StatefulWidget {
  const VerificationLogin({super.key});

  @override
  State<VerificationLogin> createState() => _VerificationLoginState();
}

class _VerificationLoginState extends State<VerificationLogin> {
  final TextEditingController _phonecontroller = TextEditingController();

  var phoneNumber = "";

  void _onCountryChange(CountryCode countryCode) {
    this.phoneNumber = countryCode.toString();
    print("New Country selected: " + countryCode.toString());
  }

  void check() {
    Verification(this.phoneNumber + " " + _phonecontroller.text);
    print("Full Text: " + phoneNumber + " " + _phonecontroller.text);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Material(
          child: Scaffold(
              body: ListView(children: [
            Container(
                padding: const EdgeInsets.only(top: 10, right: 360, left: 2),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 27,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
            Container(
              padding: const EdgeInsets.only(
                top: 30,
                left: 40,
                right: 40,
                bottom: 30,
              ),
              child: const Center(
                child: Text("Verification",
                    style: TextStyle(
                        fontFamily: "JF-Flat",
                        fontSize: 30,
                        color: Colors.redAccent,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            Column(children: <Widget>[
              // const SizedBox(height: 20,),
              SvgPicture.asset(
                "assets/images/verify login.svg",
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(children: [
                Expanded(
                  flex: 12,
                  child: InkWell(
                    child: Container(
                        //margin: const EdgeInsets.only(left: 10,right: 230),
                        child: CountryCodePicker(
                      onChanged: _onCountryChange,
                      initialSelection: "Eg",
                      favorite: const ['+20', 'Eg'],
                      alignLeft: true,
                      flagDecoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      dialogBackgroundColor: Colors.white,
                      showDropDownButton: true,
                      dialogTextStyle: const TextStyle(
                          fontFamily: "JF-Flat",
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: TextFormField(
                      controller: _phonecontroller,
                      decoration: const InputDecoration(
                        hintText: "Enter mobile phone",
                        hintStyle:
                            TextStyle(fontFamily: "JF-Flat", fontSize: 17),
                        border: UnderlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                    ),
                  ),
                )
              ]),

              const SizedBox(
                height: 50,
              ),
              Container(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10)),
                    child: const Text(
                      "Verify Number",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.normal,
                          fontFamily: "JF-Flat"),
                    ),
                    onPressed: () async {
                      check();
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        // ignore: unnecessary_string_interpolations
                        phoneNumber: '${phoneNumber + _phonecontroller.text}',
                        verificationCompleted:
                            (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {},
                        codeAutoRetrievalTimeout: (String verificationId) {},
                      );

                      // ignore: use_build_context_synchronously
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Verification(
                            // ignore: prefer_interpolation_to_compose_strings
                            phoneNumber + " " + _phonecontroller.text),
                      ));
                    },
                  ),
                ),
              ),
            ])
          ])),
        ));
  }
}
