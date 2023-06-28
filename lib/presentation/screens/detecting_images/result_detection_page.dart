import 'dart:io';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import '../../../business_logic/detection_model/detection_cubit.dart';
import '../../../business_logic/favirote_model/db_helper.dart';
import 'package:intl/intl.dart';

class ResultDetection extends StatelessWidget {
  ResultDetection({Key? key, required this.cubit, required this.patient})
      : super(key: key);

  AppCubit cubit;
  String patient;
  String datetime =
      DateFormat("hh:mm a      dd/MM/yyyy").format(DateTime.now());
  final controllerr = ScreenshotController();
  TextEditingController patientController = TextEditingController();
  DBHelper? dbHelper = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 480,
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
            cubit.iimage as File,
            fit: BoxFit.contain,
            height: 280,
            width: 350,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Container(
              width: double.infinity,
              height: 150,
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
                  const Spacer(),
                  Text(
                    "Time & Date: $datetime ",
                    // {time.hour} : ${time.minute} : ${time.second}
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
