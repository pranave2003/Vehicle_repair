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
    apiKey: 'AIzaSyDpxViBHCfBMiRABHipLopfG5XTpGjFClg',
    appId: '1:479438873302:web:71734f4e5350cd4e6e1f77',
    messagingSenderId: '479438873302',
    projectId: 'vehiclerepair-95963',
    authDomain: 'vehiclerepair-95963.firebaseapp.com',
    storageBucket: 'vehiclerepair-95963.appspot.com',
    measurementId: 'G-YWZ7F7Y6ME',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC46fo-KcO09CNa53Tm_roAF1wwCiZtXBo',
    appId: '1:479438873302:android:be0642bac44c03f46e1f77',
    messagingSenderId: '479438873302',
    projectId: 'vehiclerepair-95963',
    storageBucket: 'vehiclerepair-95963.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD2cSiaXY0fgFYwn9AmTUPzbgXquuIELFk',
    appId: '1:479438873302:ios:8d0f5888807d06ee6e1f77',
    messagingSenderId: '479438873302',
    projectId: 'vehiclerepair-95963',
    storageBucket: 'vehiclerepair-95963.appspot.com',
    iosBundleId: 'com.example.vehicleProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD2cSiaXY0fgFYwn9AmTUPzbgXquuIELFk',
    appId: '1:479438873302:ios:5603d41eca8cd5476e1f77',
    messagingSenderId: '479438873302',
    projectId: 'vehiclerepair-95963',
    storageBucket: 'vehiclerepair-95963.appspot.com',
    iosBundleId: 'com.example.vehicleProject.RunnerTests',
  );
}