import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_application_1/business_logic/detection_model/detection_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(IntiAppState());

  static AppCubit get(context) => BlocProvider.of(context);

  late bool loading = true;
  final ImagePicker _imagePicker = ImagePicker();
  XFile? image;
  File? iimage;
  List? outputs;

  Future loadBrainTumourModel() async {
    Tflite.close();
    emit(ModelLoadedSTate());
    await Tflite.loadModel(
      model: "assets/tflite_model/model_brain_tumour.tflite",
      labels: "assets/tflite_model/labels.txt",
    ).then((value) {
      loading = false;
      emit(ModelLoadedSTate());
      print('brain tumour model loaded');
    });
  }

  Future pickImgFromGallery(
      {required double imageMean,
      required double imageStd,
      required double threshold,
      required int numResult}) async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (image == null) return null;
    loading = true;
    iimage = File(image.path);
    emit(PickImageState());

    classifyImage(
      image: File(image.path),
      imageMean: imageMean,
      imageStd: imageStd,
      numResults: numResult,
      threshold: threshold,
    );

    emit(ClassifyImageState());
  }

  Future pickImgFromCamera(
      {required double imageMean,
      required double imageStd,
      required double threshold,
      required int numResult}) async {
    final XFile? image =
        await _imagePicker.pickImage(source: ImageSource.camera);

    if (image == null) return null;
    loading = true;
    iimage = File(image.path);
    emit(PickImageState());

    classifyImage(
      image: File(image.path),
      imageMean: imageMean,
      imageStd: imageStd,
      numResults: numResult,
      threshold: threshold,
    );

    emit(ClassifyImageState());
  }

  void classifyImage(
      {required File image,
      required double imageMean,
      required double imageStd,
      required int numResults,
      required double threshold}) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: numResults,
        threshold: threshold,
        imageMean: imageMean,
        imageStd: imageStd,
        asynch: true);
    loading = false;
    outputs = output;
    print(outputs);
    print(imageStd);
    emit(FinalResultState());
  }

  //make iimage and output = null function
  void clearImage() {
    iimage = null;
    outputs = null;
    emit(ClassifyImageState());
  }

  //save image to gallery function and permission function
  Future<void> saveImage(Uint8List bytes) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(bytes.buffer.asUint8List()));
      print(result);
    } else {
      print('permission denied');
    }
  }
}
