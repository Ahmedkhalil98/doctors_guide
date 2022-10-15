import 'package:doctors_guide/Controllers/location_controller.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoctorLocationMap extends StatefulWidget {
  const DoctorLocationMap({super.key});

  @override
  State<DoctorLocationMap> createState() => _DoctorLocationMapState();
}

class _DoctorLocationMapState extends State<DoctorLocationMap> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
        height: 230.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: kPrimaryColor,
          ),
        ),
        child: GetBuilder<LocationController>(
            init: LocationController(),
            builder: (mapController) {
              if (mapController.kGooglePlex == null) {
                return const Center(child: CircularProgressIndicator());
              }
              return GoogleMap(
                  markers: mapController.currentmarker,
                  initialCameraPosition: mapController.kGooglePlex!,
                  zoomControlsEnabled: true,
                  myLocationEnabled: true,
                  mapType: MapType.normal,
                  onTap: (newLatLng) {
                    mapController.onMapTap(newLatLng);
                  },
                  onMapCreated: (GoogleMapController c) {
                    mapController.controller.complete(c);
                  });
            }));
  }
}
