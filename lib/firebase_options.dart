// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDkdu4GQbK5C0R_UlYMQcw7RpvehlhcJ1k',
    appId: '1:232148425129:web:3b0d485cfdb34368b88cb8',
    messagingSenderId: '232148425129',
    projectId: 'common-flutter-apps',
    authDomain: 'common-flutter-apps.firebaseapp.com',
    storageBucket: 'common-flutter-apps.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLi8q1j2KHnceoCxldhuiCz29ea1DklLk',
    appId: '1:232148425129:android:e6382fe56f250198b88cb8',
    messagingSenderId: '232148425129',
    projectId: 'common-flutter-apps',
    storageBucket: 'common-flutter-apps.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBeB2TO58LKKH4_7cKFGGY6wX1p6-9PqO8',
    appId: '1:232148425129:ios:c4ec4eb2645c8651b88cb8',
    messagingSenderId: '232148425129',
    projectId: 'common-flutter-apps',
    storageBucket: 'common-flutter-apps.appspot.com',
    iosBundleId: 'com.example.commonFlutterApp',
  );
}