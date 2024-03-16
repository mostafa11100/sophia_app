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
    apiKey: 'AIzaSyAb7euPCp2FW8qpTn9KmOj7SiJSY3CPlGU',
    appId: '1:745488927608:web:928345c769753c5dc4968d',
    messagingSenderId: '745488927608',
    projectId: 'sophia-chat',
    authDomain: 'sophia-chat.firebaseapp.com',
    storageBucket: 'sophia-chat.appspot.com',
    measurementId: 'G-0YB70ERYVY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxeSorF9ZB8SANZUpNLknGiQTGKEy6ngY',
    appId: '1:745488927608:android:7c217acd9c786201c4968d',
    messagingSenderId: '745488927608',
    projectId: 'sophia-chat',
    storageBucket: 'sophia-chat.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAxRJ8_RFsGKtmnnJF7TTEJbqu-7ZTdZSA',
    appId: '1:745488927608:ios:fd34a6cfa5359ca8c4968d',
    messagingSenderId: '745488927608',
    projectId: 'sophia-chat',
    storageBucket: 'sophia-chat.appspot.com',
    iosBundleId: 'com.example.sophiaChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAxRJ8_RFsGKtmnnJF7TTEJbqu-7ZTdZSA',
    appId: '1:745488927608:ios:fad7957f77c9771dc4968d',
    messagingSenderId: '745488927608',
    projectId: 'sophia-chat',
    storageBucket: 'sophia-chat.appspot.com',
    iosBundleId: 'com.example.sophiaChat.RunnerTests',
  );
}
