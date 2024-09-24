import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool hidenPassword = true;
  bool ishidenPassword = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        //backgroundColor: Colors.redAccent,

        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10, left: 2, right: 360),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 27,
                  )),
            ),
            Container(
              padding: const EdgeInsets.all(50),
              child: const Center(
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 27,
                      fontFamily: "JF-Flat",
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SvgPicture.asset("assets/images/reset Password.svg",
                    height: 200, allowDrawingOutsideViewBox: true),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                        obscureText: hidenPassword,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            label: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 9),
                              child: const Text(
                                "New Password ",
                                style: TextStyle(
                                    fontFamily: "JF-Flat", fontSize: 18),
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
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
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                        obscureText: ishidenPassword,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 30),
                            label: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 9),
                              child: const Text(
                                "Confirm Password ",
                                style: TextStyle(
                                    fontFamily: "JF-Flat", fontSize: 18),
                              ),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
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
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    // primary: Colors.redAccent,
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 25, fontFamily: "JF-Flat"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
