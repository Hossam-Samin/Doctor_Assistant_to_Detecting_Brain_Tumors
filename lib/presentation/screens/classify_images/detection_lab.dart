// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_application_1/business_logic/favirote_model/db_helper.dart';
import 'package:flutter_application_1/business_logic/favirote_model/favirote_model.dart';
import 'package:flutter_application_1/business_logic/favirote_model/favirote_provider.dart';
import 'package:flutter_application_1/presentation/screens/classify_images/result_with_output_of_detection.dart';
import 'package:flutter_application_1/presentation/screens/favirote_screen/favirote_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import '../../../business_logic/detection_model/detection_cubit.dart';
import '../../../business_logic/detection_model/detection_state.dart';
import 'package:lottie/lottie.dart';

class Result extends StatefulWidget {
  String lottieAnimationName;
  double imageMean;
  double imageStd;
  int numResults;
  double threshold;
  final controllerr = ScreenshotController();

  Result({
    Key? key,
    required this.lottieAnimationName,
    required this.imageMean,
    required this.imageStd,
    required this.numResults,
    required this.threshold,
  }) : super(key: key);

  String patient = "";

  @override
  // ignore: no_logic_in_create_state
  State<Result> createState() => _ResultState(
        imageMean: 244.0,
        imageStd: 244.0,
        lottieAnimationName: 'brain_tumor',
        numResults: 4,
        threshold: 0.2,
        // cubit: AppCubit(),
        // patient: '',
      );
}

class _ResultState extends State<Result> {
  _ResultState({
    required this.lottieAnimationName,
    required this.imageMean,
    required this.imageStd,
    required this.numResults,
    required this.threshold,
    // required this.patient,
    // required this.cubit,
  });

  String lottieAnimationName;
  double imageMean;
  double imageStd;
  int numResults;
  double threshold;
  final controllerr = ScreenshotController();
  TextEditingController patientController = TextEditingController();
  void patientName() {
    ("" + patientController.text);
    // ignore: avoid_print
    print("Patient Name: " + patientController.text);
  }

  DBHelper? dbHelper = DBHelper();

  // AppCubit cubit;
  // final String? patient;
  // var time = DateTime.now();
  // List<String>? patientNameI;
  // List<String>? res;
  // List<String>? rate;
  // List<String>? currentTime;
  // List<String>? date;
  // @override
  // void initState() {
  //   patientNameI = ["Patient Name: $patient"];
  //   res = ["Result: ${cubit.outputs![0]["label"]}"];
  //   rate = ["Rate: ${cubit.outputs![0]["confidence"] * 100}%"];
  //   currentTime = [
  //     "Curent Time -> ${time.hour} : ${time.minute} : ${time.second}"
  //   ];
  //   date = ["Date -> ${time.day} - ${time.month} - ${time.year}"];

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<FavProvider>(context);
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Screenshot(
          controller: controllerr,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              actions: [
                Center(
                  child: Badge(
                    label:
                        Consumer<FavProvider>(builder: (context, value, child) {
                      return Text(value.getCounter().toString());
                    }),
                    backgroundColor: Colors.deepPurple.withOpacity(.6),
                    alignment: AlignmentDirectional.bottomEnd,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const FaviroteScreen(),
                            ));
                      },
                      icon: const Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              title: const Text(
                'Detection Lab',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'JF-Flat',
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
            ),
            body: cubit.loading
                ? Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 10,
                          ),
                          child: TextFormField(
                              controller: patientController,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 16),
                                label: const Text(
                                  "Add Patient: ",
                                  style: TextStyle(
                                      fontFamily: "JF-Flat", fontSize: 20),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                prefixIcon: const Icon(
                                  Icons.person,
                                  color: Colors.blueGrey,
                                ),
                              )),
                        ),
                        cubit.iimage == null
                            ? Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 40),
                                child: Lottie.network(
                                    'https://assets10.lottiefiles.com/packages/lf20_zrqthn6o.json'),
                              )
                            : Result1(
                                cubit: cubit,
                                patient: patientController.text,
                              ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 25,
                            horizontal: 25,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              cubit.iimage == null
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(100, 50),
                                          primary:
                                              Colors.deepPurple.withOpacity(.5),
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        onPressed: () async {
                                          final imageee = await controllerr
                                              .captureFromWidget(Result1(
                                            cubit: cubit,
                                            patient: patientController.text,
                                          ));
                                          await AppCubit.get(context)
                                              .saveImage(imageee);
                                        },
                                        child: const Text(
                                          'Save to Gallery',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "JF-Flat",
                                          ),
                                        ),
                                      ),
                                    ),
                              cubit.iimage == null
                                  ? Container()
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: const Size(100, 50),
                                          primary:
                                              Colors.deepPurple.withOpacity(.5),
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                        ),
                                        onPressed: () {
                                          // dbHelper!
                                          //     .insert(FaviroteModel(
                                          //   patientName:
                                          //       patientNameI.toString(),
                                          //   result: res.toString(),
                                          //   rate: rate.toString(),
                                          //   time: currentTime.toString(),
                                          //   date: date.toString(),
                                          // ))
                                          //     .then((value) {
                                          //   print("Product is add");
                                          //   cart.addCounter();
                                          //   cart.addRate(rate.toString());
                                          // }).onError((error, stackTrace) {
                                          //   print(error.toString());
                                          // });
                                        },
                                        child: const Text(
                                          'Add to Favirote ',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "JF-Flat",
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
            bottomNavigationBar: BottomAppBar(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 20, right: 20, left: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(100, 50),
                    backgroundColor: Colors.deepPurple.withOpacity(0.5),
                    elevation: 1.5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {
                    cubit.pickImgFromGallery(
                      imageMean: imageMean,
                      imageStd: imageStd,
                      numResult: numResults,
                      threshold: threshold,
                    );
                    // try {

                    // } catch (classification) {
                    //   print(classification);
                    // }
                  },
                  child: const Text(
                    'Detection',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontFamily: "JF-Flat",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is FinalResultState) {
          // showDialog(
          //     context: context,
          //     builder: (context) {
          //       return AlertDialog(
          //         title: Text(
          //           AppCubit.get(context).outputs![0]['label'],
          //           style: const TextStyle(
          //             color: Colors.red,
          //             fontSize: 22,
          //           ),
          //         ),
          //         content: const Text(
          //           'Warning: this result may not accurate so you need to consulting a doctor as soon as possible\n(The accuracy of the results is 98 %)',
          //           style: TextStyle(color: Colors.black, fontSize: 15),
          //         ),
          //         actions: [
          //           Center(
          //             child: TextButton(
          //               onPressed: () {
          //                 Navigator.pop(context);
          //               },
          //               child: const Text(
          //                 'OK',
          //                 style: TextStyle(
          //                   fontSize: 20,
          //                   color: Colors.white,
          //                 ),
          //               ),
          //               style: TextButton.styleFrom(
          //                 backgroundColor: Colors.blue,
          //                 minimumSize: const Size(100, 50),
          //               ),
          //             ),
          //           ),
          //         ],
          //       );
          //     });
        }
      },
    );
  }
}
