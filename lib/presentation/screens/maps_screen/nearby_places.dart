import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NearbyPlacesBottomSheet extends StatefulWidget {
  const NearbyPlacesBottomSheet({super.key});

  @override
  State<NearbyPlacesBottomSheet> createState() =>
      _NearbyPlacesBottomSheetState();
}

class _NearbyPlacesBottomSheetState extends State<NearbyPlacesBottomSheet> {
  String apiKey = "";
  String raduis = "30";
  double latitude = 31.451856;
  double longtude = 30.287546;
  void getNearbyPlaces() async {
    // var url = Uri.parse(
    //     "https://maps.googleapis.com/maps/api/palce/nearbysearch/json?location=" +
    //         latitude.toString() +
    //         "," +
    //         longtude.toString() +
    //         "&raduis=" +
    //         raduis +
    //         "&Key=" +
    //         apiKey);
    // var response = await http.post(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ElevatedButton(
                onPressed: () {
                  getNearbyPlaces();
                },
                child: const Text(
                  "Get Neaeby Places",
                  style: TextStyle(fontSize: 18, fontFamily: "JF-Flat"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
