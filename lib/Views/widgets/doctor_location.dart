import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoctorLocationMap extends StatefulWidget {
  const DoctorLocationMap({super.key});

  @override
  State<DoctorLocationMap> createState() => _DoctorLocationMapState();
}

class _DoctorLocationMapState extends State<DoctorLocationMap> {
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

    setState(() {
      kGooglePlex = CameraPosition(
        target: latLng,
        zoom: 14.0,
      );
    });
    getAddress(latLng.latitude, latLng.longitude);
  }

  Set<Marker> currentmarker = {
    const Marker(
        draggable: true,
        markerId: MarkerId("1"),
        position: LatLng(36.7829415, 42.8798924)),
  };

  @override
  void initState() {
    getPermission();
    super.initState();
  }

  getAddress(double lat, double long) async {
    List placemarks = await placemarkFromCoordinates(lat, long);
    // print(placemarks);
    Placemark place = placemarks[0];
    setState(() {
      Address =
          '${place.administrativeArea}, ${place.subAdministrativeArea}, ${place.locality}, ${place.subLocality}, ${place.street} ';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Text(Address),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black, width: 2, style: BorderStyle.solid),
          ),
          child: kGooglePlex == null
              ? const Placeholder()
              : GoogleMap(
                  onCameraMove: (CameraPosition cameraPosition) {
                    print(cameraPosition.zoom);
                  },
                  markers: currentmarker,
                  initialCameraPosition: kGooglePlex!,
                  zoomControlsEnabled: true,
                  mapType: MapType.normal,
                  onTap: (newLatLng) {
                    currentmarker.remove(const Marker(markerId: MarkerId("1")));
                    currentmarker.add(Marker(
                        markerId: const MarkerId("1"), position: newLatLng));
                    setState(() {});
                    getAddress(newLatLng.latitude, newLatLng.longitude);
                  },
                  onMapCreated: (GoogleMapController c) {
                    controller.complete(c);
                  }),
        ),
      ],
    );
  }
}
