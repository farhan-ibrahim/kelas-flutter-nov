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
    apiKey: 'AIzaSyAwcXRX8TB8EQvingrbGHhDAXrawOaQHnI',
    appId: '1:81012285227:web:976ee45290a9dff7cd6f6e',
    messagingSenderId: '81012285227',
    projectId: 'first-app-e1ce0',
    authDomain: 'first-app-e1ce0.firebaseapp.com',
    storageBucket: 'first-app-e1ce0.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCnDJ35HW2Bv-eGFo8X8l8QPmWY7diBofQ',
    appId: '1:81012285227:android:30d5f496eb2d9cbecd6f6e',
    messagingSenderId: '81012285227',
    projectId: 'first-app-e1ce0',
    storageBucket: 'first-app-e1ce0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAPFQamTTJZa5VbHaxZVzjh_4ATYiOHsYI',
    appId: '1:81012285227:ios:fdc39a9f04657ed2cd6f6e',
    messagingSenderId: '81012285227',
    projectId: 'first-app-e1ce0',
    storageBucket: 'first-app-e1ce0.appspot.com',
    iosBundleId: 'com.example.firstApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAPFQamTTJZa5VbHaxZVzjh_4ATYiOHsYI',
    appId: '1:81012285227:ios:abcc7bfce4133a20cd6f6e',
    messagingSenderId: '81012285227',
    projectId: 'first-app-e1ce0',
    storageBucket: 'first-app-e1ce0.appspot.com',
    iosBundleId: 'com.example.firstApp.RunnerTests',
  );
}
