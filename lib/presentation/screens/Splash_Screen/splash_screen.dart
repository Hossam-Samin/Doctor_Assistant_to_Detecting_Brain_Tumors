import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import '../Home_App/home_App.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      Navigator.of(context).pushReplacement(CupertinoPageRoute(
        builder: (context) => Home(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 100, left: 50, right: 50),
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(
                "assets/images/clinic-splash screen.svg",
                height: 250,
              ),
              const SizedBox(height: 100),
              const Text(
                "Doctor Assistant System",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "JF-Flat",
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const SpinKitThreeBounce(
                color: Colors.red,
                size: 35,
              )
            ],
          ),
        ),
      ),
    );
  }
}
