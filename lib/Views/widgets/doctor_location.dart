import 'package:doctors_guide/Controllers/location_controller.dart';
import 'package:doctors_guide/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DoctorLocationMap extends StatefulWidget {
  DoctorLocationMap({super.key, this.latLong, this.doctorName});
  String? latLong;
  String? doctorName;

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
              List splitString = widget.latLong!.split(',');
              LatLng latAndLng = LatLng(
                  double.parse(splitString[0]), double.parse(splitString[1]));

              Set<Marker> placeMarker = {
                Marker(
                    draggable: true,
                    markerId: const MarkerId("1"),
                    infoWindow: InfoWindow(
                      title: widget.doctorName,
                    ),
                    position: latAndLng),
              };
              return GoogleMap(
                  markers: placeMarker,
                  initialCameraPosition: CameraPosition(
                    target: latAndLng,
                    zoom: 14.0,
                  ),
                  zoomControlsEnabled: true,
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController c) {
                    mapController.controller.complete(c);
                  });
            }));
  }
}
