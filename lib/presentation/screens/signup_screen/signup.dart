import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Don’t have an acount ? ",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 21,
                    fontFamily: "JF-Flat"),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("Sign In Page");
                  },
                  child: const Text("Sign up",
                      style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          decoration: TextDecoration.underline,
                          fontFamily: "JF-Flat"))),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                "OR",
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 22,
                    fontFamily: "JF-Flat"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
