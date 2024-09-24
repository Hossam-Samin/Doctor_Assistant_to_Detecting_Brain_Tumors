// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import '../../../business_logic/detection_model/detection_cubit.dart';
import '../../../business_logic/detection_model/detection_state.dart';
import 'package:lottie/lottie.dart';
import 'package:badges/badges.dart' as badges;

import '../../../business_logic/favirote_model/db_helper.dart';
import '../../../business_logic/favirote_model/favirote_model.dart';
import 'package:intl/intl.dart';

import '../../../business_logic/favirote_model/favirote_provider.dart';
import '../favirote_screen/favirote_screen.dart';
import 'result_detection_page.dart';

class DetectionHome extends StatefulWidget {
  String lottieAnimationName;
  double imageMean;
  double imageStd;
  int numResults;
  double threshold;
  final controllerr = ScreenshotController();

  DetectionHome({
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
  State<DetectionHome> createState() => _DetectionHomeState(
        imageMean: 244.0,
        imageStd: 244.0,
        lottieAnimationName: 'brain_tumor',
        numResults: 4,
        threshold: 0.2,
      );
}

class _DetectionHomeState extends State<DetectionHome> {
  _DetectionHomeState({
    required this.lottieAnimationName,
    required this.imageMean,
    required this.imageStd,
    required this.numResults,
    required this.threshold,
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
  String datetime =
      DateFormat("hh:mm a      dd/MM/yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    FavProvider cart = Provider.of<FavProvider>(context);
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
                  child: badges.Badge(
                    badgeContent:
                        Consumer<FavProvider>(builder: (context, state, child) {
                      return Text(
                        state.getCounter().toString(),
                      );
                    }),
                    badgeAnimation: const badges.BadgeAnimation.rotation(
                        animationDuration: Duration(milliseconds: 500)),
                    position: badges.BadgePosition.topEnd(),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FaviroteScreen(),
                          ));
                    },
                    child: const Icon(
                      Icons.favorite_border_rounded,
                      color: Colors.black,
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
                'Detection',
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
                                      fontFamily: "JF-Flat", fontSize: 16),
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
                            : ResultDetection(
                                cubit: cubit,
                                patient: patientController.text,
                              ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            cubit.iimage == null
                                ? Container()
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(100, 50),
                                        backgroundColor: Colors.lightBlue,
                                        // primary: Colors.lightBlue,
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                      ),
                                      onPressed: () async {
                                        final saveToGallery = await controllerr
                                            .captureFromWidget(ResultDetection(
                                          cubit: cubit,
                                          patient: patientController.text,
                                        ));
                                        await AppCubit.get(context)
                                            .saveImage(saveToGallery);
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
                                        backgroundColor: Colors.lightBlue,
                                        // primary: Colors.lightBlue,
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                      ),
                                      onPressed: () {
                                        dbHelper!
                                            .insert(FaviroteModel(
                                          patientName: patientController.text,
                                          result: cubit.outputs![0]["label"]
                                              .toString(),
                                          rate: cubit.outputs![0]
                                                  ["confidence"] *
                                              100,
                                          date: datetime.toString(),
                                          // image: cubit.iimage,
                                        ))
                                            .then((value) {
                                          print("This Case is added");
                                          cart.addCounter();
                                        }).onError((error, stackTrace) {
                                          print(error.toString());
                                        });
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    cubit.pickImgFromGallery(
                      imageMean: imageMean,
                      imageStd: imageStd,
                      numResult: numResults,
                      threshold: threshold,
                    );
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
        if (state is FinalResultState) {}
      },
    );
  }
}
