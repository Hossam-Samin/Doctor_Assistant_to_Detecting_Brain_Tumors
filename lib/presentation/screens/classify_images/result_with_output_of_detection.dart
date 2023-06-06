import 'dart:io';

import 'package:flutter/material.dart';

import '../../../business_logic/detection_model/detection_cubit.dart';

class Result1 extends StatelessWidget {
  Result1({Key? key, required this.cubit, required this.patient})
      : super(key: key);

  AppCubit cubit;
  final String patient;
  var time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    double height = 620;
    return Container(
      height: height * 0.8,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: [Colors.lightBlueAccent, Colors.grey, Colors.deepPurple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          Image.file(
            cubit.iimage! as File,
            fit: BoxFit.contain,
            height: height * 0.45,
            width: 350,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Container(
              width: double.infinity,
              height: height * 0.2,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [
                    Colors.lightBlueAccent,
                    Colors.grey,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Text(
                    "Patient Name: $patient",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "JF-Flat"),
                  ),
                  const Spacer(),
                  Text(
                    "Result: ${cubit.outputs![0]["label"]}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "JF-Flat"),
                  ),
                  const Spacer(),
                  Text(
                    "Rate: ${cubit.outputs![0]["confidence"] * 100} %",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: "JF-Flat",
                    ),
                  ),
                  Text(
                    "Curent Time -> ${time.hour} : ${time.minute} : ${time.second}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "JF-Flat"),
                  ),
                  const Spacer(),
                  Text(
                    "Date -> ${time.day} - ${time.month} - ${time.year}",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "JF-Flat"),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
