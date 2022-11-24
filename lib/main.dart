import 'package:doctors_guide/firebase_options.dart';
import 'package:doctors_guide/root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? localStorage;
SharedPreferences? tempStorage;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RequestConfiguration config = RequestConfiguration(
      testDeviceIds: ['887b672d-9727-4ec3-b8b9-37180495732e']);
  MobileAds.instance.updateRequestConfiguration(config);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  localStorage = await SharedPreferences.getInstance();
  tempStorage = await SharedPreferences.getInstance();
  runApp(const MyApp());
}
