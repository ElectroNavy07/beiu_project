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
    apiKey: 'AIzaSyBVFdNo3v7JAiU7RS2AJ2ZpWhUarFBErEA',
    appId: '1:1075847418609:web:099388cffd44cff7f0cf50',
    messagingSenderId: '1075847418609',
    projectId: 'beiu-project-16c5e',
    authDomain: 'beiu-project-16c5e.firebaseapp.com',
    storageBucket: 'beiu-project-16c5e.appspot.com',
    measurementId: 'G-8Y0ZCZNHBT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCBfz_xNMtx0nzJnkV4q710c-4xEwl0PBQ',
    appId: '1:1075847418609:android:c93f331d2932c001f0cf50',
    messagingSenderId: '1075847418609',
    projectId: 'beiu-project-16c5e',
    storageBucket: 'beiu-project-16c5e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAqx0P5JfQjwl3TAbp8YI_hexWkORgJZdc',
    appId: '1:1075847418609:ios:9a112ecd9f177fb2f0cf50',
    messagingSenderId: '1075847418609',
    projectId: 'beiu-project-16c5e',
    storageBucket: 'beiu-project-16c5e.appspot.com',
    iosClientId: '1075847418609-ujdp3poi1t44t87ir8md1ntire0rehcv.apps.googleusercontent.com',
    iosBundleId: 'arhirefilip.com.beiuProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAqx0P5JfQjwl3TAbp8YI_hexWkORgJZdc',
    appId: '1:1075847418609:ios:9a112ecd9f177fb2f0cf50',
    messagingSenderId: '1075847418609',
    projectId: 'beiu-project-16c5e',
    storageBucket: 'beiu-project-16c5e.appspot.com',
    iosClientId: '1075847418609-ujdp3poi1t44t87ir8md1ntire0rehcv.apps.googleusercontent.com',
    iosBundleId: 'arhirefilip.com.beiuProject',
  );
}
