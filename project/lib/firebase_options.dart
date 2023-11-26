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
    apiKey: 'AIzaSyClQpN8AEC7kJLRXTIlrjWxNRhzRCl2oNQ',
    appId: '1:259420166349:web:aefcb1acbf000149f43184',
    messagingSenderId: '259420166349',
    projectId: 'activity-8414f',
    authDomain: 'activity-8414f.firebaseapp.com',
    storageBucket: 'activity-8414f.appspot.com',
    measurementId: 'G-R5LJKY6XD3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC2U9TqRDLcnFCeElm3UXuTvJJ0FhQbZuU',
    appId: '1:259420166349:android:c46bc8158912a64cf43184',
    messagingSenderId: '259420166349',
    projectId: 'activity-8414f',
    storageBucket: 'activity-8414f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAb5nzpcFPSHM_hdAIVnjythEcyrbUWYwA',
    appId: '1:259420166349:ios:0eda643c46c0416ef43184',
    messagingSenderId: '259420166349',
    projectId: 'activity-8414f',
    storageBucket: 'activity-8414f.appspot.com',
    iosBundleId: 'ma.kinan.project',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAb5nzpcFPSHM_hdAIVnjythEcyrbUWYwA',
    appId: '1:259420166349:ios:0eda643c46c0416ef43184',
    messagingSenderId: '259420166349',
    projectId: 'activity-8414f',
    storageBucket: 'activity-8414f.appspot.com',
    iosBundleId: 'ma.kinan.project',
  );
}