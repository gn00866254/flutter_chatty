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
    apiKey: 'AIzaSyDu9KldlHX2lbMGGcdOm_KiA9SdLoo4cbQ',
    appId: '1:499952061299:web:f7866c5a0f848a6afd9306',
    messagingSenderId: '499952061299',
    projectId: 'flutter-video-audio-chat-5fcae',
    authDomain: 'flutter-video-audio-chat-5fcae.firebaseapp.com',
    storageBucket: 'flutter-video-audio-chat-5fcae.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCeq64KUWYUvlGKO5xCEdi5PBPmAqDpzWk',
    appId: '1:499952061299:android:3abd06b671b916fcfd9306',
    messagingSenderId: '499952061299',
    projectId: 'flutter-video-audio-chat-5fcae',
    storageBucket: 'flutter-video-audio-chat-5fcae.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC2ll9VL6JmTPDonGRHE2aWY9T5YKHLmys',
    appId: '1:499952061299:ios:a0f684ccd3a2c824fd9306',
    messagingSenderId: '499952061299',
    projectId: 'flutter-video-audio-chat-5fcae',
    storageBucket: 'flutter-video-audio-chat-5fcae.appspot.com',
    iosBundleId: 'com.dbestech.chatty',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC2ll9VL6JmTPDonGRHE2aWY9T5YKHLmys',
    appId: '1:499952061299:ios:510a157fd65262a4fd9306',
    messagingSenderId: '499952061299',
    projectId: 'flutter-video-audio-chat-5fcae',
    storageBucket: 'flutter-video-audio-chat-5fcae.appspot.com',
    iosBundleId: 'com.example.chatty.RunnerTests',
  );
}