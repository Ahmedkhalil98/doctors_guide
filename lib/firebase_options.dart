// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCX72AN99zjFb1E4pNqjkJqv1Z8EqSDS10',
    appId: '1:179682353866:web:13944af9e869c847cdca33',
    messagingSenderId: '179682353866',
    projectId: 'user-86074',
    authDomain: 'user-86074.firebaseapp.com',
    storageBucket: 'user-86074.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbxBHqEFjeicxy-454XvchQgFAMFk99QE',
    appId: '1:179682353866:android:66241230f9c2335ccdca33',
    messagingSenderId: '179682353866',
    projectId: 'user-86074',
    storageBucket: 'user-86074.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDRwD6PjRCDpl2OOBBx39lmDpDSzyb8P80',
    appId: '1:179682353866:ios:ddf233824db24ea4cdca33',
    messagingSenderId: '179682353866',
    projectId: 'user-86074',
    storageBucket: 'user-86074.appspot.com',
    iosClientId: '179682353866-ombe9plro7oa5rjancj0s5c5ih3h0rah.apps.googleusercontent.com',
    iosBundleId: 'com.example.doctorsGuide',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDRwD6PjRCDpl2OOBBx39lmDpDSzyb8P80',
    appId: '1:179682353866:ios:ddf233824db24ea4cdca33',
    messagingSenderId: '179682353866',
    projectId: 'user-86074',
    storageBucket: 'user-86074.appspot.com',
    iosClientId: '179682353866-ombe9plro7oa5rjancj0s5c5ih3h0rah.apps.googleusercontent.com',
    iosBundleId: 'com.example.doctorsGuide',
  );
}
