import 'package:doctors_guide/firebase_options.dart';
import 'package:doctors_guide/root.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? localStorage;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  localStorage = await SharedPreferences.getInstance();
  runApp(const MyApp());
}
