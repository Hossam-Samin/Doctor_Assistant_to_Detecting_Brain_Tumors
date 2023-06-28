import 'package:flutter/material.dart';

import '../../../../business_logic/detection_model/detection_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../detection_page.dart';
import '../result_detection_page.dart';

class BrainScreen extends StatefulWidget {
  const BrainScreen({Key? key}) : super(key: key);

  @override
  State<BrainScreen> createState() => _BrainScreenState();
}

class _BrainScreenState extends State<BrainScreen> {
  ResultDetection res =
      ResultDetection(cubit: AppCubit(), patient: "Hossam Samin");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              size: 25,
              color: Colors.black,
            ),
          ),
          title: const Text(
            'Brain Tumor Detection',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w300,
              fontFamily: 'JF-Flat',
              color: Colors.black,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            color: Colors.white,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  const Divider(
                    endIndent: 15,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Medical Corner provides Brain Tumor',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontFamily: "JF-Flat"),
                      ),
                      const Text(
                        'Detection with accuracy 98 %.',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            fontFamily: "JF-Flat"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetectionHome(
                                        numResults: 4,
                                        threshold: 0.2,
                                        imageMean: 244.0,
                                        imageStd: 244.0,
                                        lottieAnimationName: 'brain_tumor',
                                      ),
                                    ),
                                  );
                                  AppCubit.get(context).loadBrainTumourModel();
                                  AppCubit.get(context).clearImage();
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Container(
                                    height: 125,
                                    width: 125,
                                    color: Colors.pink.withOpacity(.5),
                                    child: const Icon(
                                      FontAwesomeIcons.image,
                                      color: Colors.white,
                                      size: 80,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                'Upload Image',
                                style: TextStyle(
                                    color: Color(0xff004EC4),
                                    fontSize: 20,
                                    fontFamily: "JF-Flat"),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Container(
                                  height: 125,
                                  width: 125,
                                  color: Colors.pink.withOpacity(.5),
                                  child: IconButton(
                                    onPressed: () {
                                      // getCamera();
                                      // cubit.pickImgFromCamera(
                                      //    imageMean: 220.0,
                                      //     imageStd: 220.0,
                                      //     threshold: 0.6,
                                      //     numResult: 5

                                      // )
                                      AppCubit.get(context).pickImgFromCamera(
                                          imageMean: 220.0,
                                          imageStd: 220.0,
                                          threshold: 0.6,
                                          numResult: 5);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => DetectionHome(
                                                lottieAnimationName:
                                                    'brain tumor',
                                                imageMean: 220.0,
                                                imageStd: 220.0,
                                                numResults: 5,
                                                threshold: 0.6),
                                          ));
                                      AppCubit.get(context)
                                          .loadBrainTumourModel();
                                      AppCubit.get(context).clearImage();
                                    },
                                    icon: const Icon(
                                      Icons.camera_alt_rounded,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      size: 80,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Shot Image',
                                style: TextStyle(
                                    color: Color(0xff004EC4),
                                    fontSize: 20,
                                    fontFamily: "JF-Flat"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(
                    endIndent: 15,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
