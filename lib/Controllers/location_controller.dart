import 'dart:async';

import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationController extends GetxController {
  Completer<GoogleMapController> controller = Completer();
  CameraPosition? kGooglePlex;
  Position? currentLocation;
  late LatLng latLng;
  String Address = 'الموقع على الخريطة ';

  Future getPermission() async {
    bool services;
    LocationPermission permission;
    services = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      getposition();
    } else {
      permission = await Geolocator.requestPermission();
      getposition();
    }
  }

  Future getposition() async {
    currentLocation =
        await Geolocator.getCurrentPosition().then((value) => value);
    latLng = LatLng(currentLocation!.latitude, currentLocation!.longitude);

    print(latLng);
    kGooglePlex = CameraPosition(
      target: latLng,
      zoom: 14.0,
    );
    update();

    // getAddress(latLng.latitude, latLng.longitude);
  }

  Set<Marker> currentmarker = {
    const Marker(
      draggable: true,
      markerId: MarkerId("1"),
      // position: LatLng(latLng.latitude , latLng.longitude),
    ),
  };

  // getAddress(double lat, double long) async {
  //   List placemarks = await placemarkFromCoordinates(lat, long);

  //   Placemark place = placemarks[0];

  //   Address =
  //       '${place.administrativeArea}, ${place.subAdministrativeArea}, ${place.locality}, ${place.subLocality}, ${place.street} ';
  //   update();
  // }

  @override
  void onInit() {
    getPermission();
    super.onInit();
  }

  onMapTap(LatLng newLatLng) {
    currentmarker.remove(const Marker(markerId: MarkerId("1")));
    currentmarker
        .add(Marker(markerId: const MarkerId("1"), position: newLatLng));
    latLng = newLatLng;
    update();
    // getAddress(newLatLng.latitude, newLatLng.longitude);
  }
}
