import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'nearby_places.dart';

class GoogleMapsPge extends StatefulWidget {
  const GoogleMapsPge({key}) : super(key: key);

  @override
  State<GoogleMapsPge> createState() => _GoogleMapsPgeState();
}

class _GoogleMapsPgeState extends State<GoogleMapsPge> {
  // final Completer<GoogleMapController> _controller = Completer();
  GoogleMapController? gmc;
  var myMarkers = HashSet<Marker>();
  CameraPosition? _kGooglePlex;
  // late BitmapDescriptor customMarker;
  StreamSubscription<Position>? ps;
  Position? cl;
  var lat;
  var long;

  // getCustomMarker() async {
  //   customMarker = await BitmapDescriptor.fromAssetImage(
  //     const ImageConfiguration(size: Size(12, 12)),
  //     'assets/images/hossam.jpg',
  //   ).then((icon) {
  //     setState(() {
  //       customMarker = icon;
  //     });
  //     return customMarker;
  //   });
  // }

  Future<void> getPermission() async {
    // bool services;
    // LocationPermission permition;

    // permition = await Geolocator.checkPermission();
    // if (permition == LocationPermission.denied) {
    //   permition = await Geolocator.requestPermission();
    // } else if (permition == LocationPermission.always) {
    //   getLatAndLang();
    // }
    // print(services);
    final status = await Permission.location.request();
    if (status.isDenied) {
      LocationPermission permission = await Geolocator.checkPermission();
      print(permission);
    } else if (status.isGranted) {
      getLatAndLang();
    }
  }

  Future<void> getLatAndLang() async {
    cl = await Geolocator.getCurrentPosition().then((value) => value);
    lat = cl!.latitude;
    long = cl!.longitude;
    _kGooglePlex = CameraPosition(
      target: LatLng(lat, long),
      zoom: 14.5,
    );
    setState(() {});
  }

  @override
  void initState() {
    ps = Geolocator.getPositionStream().listen((Position pos) {});

    getPermission();
    getLatAndLang();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Google Maps",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w300,
              fontFamily: "JF-Flat",
              color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.black,
            )),
      ),
      body: Column(
        children: [
          // ignore: unnecessary_null_comparison,
          _kGooglePlex == null
              ? Center(
                  child: Container(
                      margin: const EdgeInsets.only(top: 300),
                      child: const CircularProgressIndicator()),
                )
              : Container(
                  height: 640,
                  width: MediaQuery.of(context).size.width,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    tiltGesturesEnabled: true,
                    compassEnabled: true,
                    scrollGesturesEnabled: true,
                    zoomGesturesEnabled: true,
                    // polylines: Set<Polyline>.of(polyines.value) ,
                    initialCameraPosition: _kGooglePlex!,
                    onMapCreated: (GoogleMapController googleMapController) {
                      gmc = googleMapController;
                      setState(() {
                        myMarkers.add(
                          Marker(
                            markerId: const MarkerId('1'),
                            position: LatLng(lat, long),
                            draggable: true,
                            onDragEnd: (value) {},
                            infoWindow: InfoWindow(
                                title: 'My Current Location',
                                onTap: () {
                                  print('My Current Location');
                                }),
                            // icon: customMarker,
                          ),
                        );
                      });
                    },
                    markers: myMarkers,
                  ),
                ),

          // floatingActionButton: FloatingActionButton(
          //     child: const Icon(
          //       Icons.location_searching,
          //       color: Colors.white,
          //     ),
          //     onPressed: () {
          //       // getLocation();
          //     }),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 5, bottom: 20, left: 20, right: 20),
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13)),
                  context: context,
                  builder: (context) {
                    return const NearbyPlacesBottomSheet();
                  });
            },
            style: ElevatedButton.styleFrom(
                primary: Colors.redAccent.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13))),
            child: const Text(
              "Nearby Hospital",
              style: TextStyle(fontSize: 18, fontFamily: "JF-Flat"),
            ),
          ),
        ),
      ),
    );
  }
}
