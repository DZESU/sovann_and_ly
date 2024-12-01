// File generated by FlutterFire CLI.
// ignore_for_file: type=lint

import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter/material.dart';

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
        return windows;
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
    apiKey: 'AIzaSyAFuWToimaHsKLkNCJx_E233ILj0WhMkBY',
    appId: '1:573399434401:web:10b1cf471b75c031cbdce0',
    messagingSenderId: '573399434401',
    projectId: 'sovann-sreyly-wedding',
    authDomain: 'sovann-sreyly-wedding.web.com',
    storageBucket: 'sovann-sreyly-wedding.firebasestorage.app',
    databaseURL: 'https://messages.asia-southeast1.firebasedatabase.app'
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBzI1srGZp7IY1LNfYU82eYNhclp9XAtuA',
    appId: '1:573399434401:android:91e60e74899fae7ccbdce0',
    messagingSenderId: '573399434401',
    projectId: 'sovann-sreyly-wedding',
    storageBucket: 'sovann-sreyly-wedding.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDEyImWhIZp9zWWTPQrLstJH9NfX0Kvl5k',
    appId: '1:573399434401:ios:1ff79c462f0259b5cbdce0',
    messagingSenderId: '573399434401',
    projectId: 'sovann-sreyly-wedding',
    storageBucket: 'sovann-sreyly-wedding.firebasestorage.app',
    iosBundleId: 'dev.sovann.sovannAndLy',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDEyImWhIZp9zWWTPQrLstJH9NfX0Kvl5k',
    appId: '1:573399434401:ios:1ff79c462f0259b5cbdce0',
    messagingSenderId: '573399434401',
    projectId: 'sovann-sreyly-wedding',
    storageBucket: 'sovann-sreyly-wedding.firebasestorage.app',
    iosBundleId: 'dev.sovann.sovannAndLy',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAFuWToimaHsKLkNCJx_E233ILj0WhMkBY',
    appId: '1:573399434401:web:da2e690d99b6e6cacbdce0',
    messagingSenderId: '573399434401',
    projectId: 'sovann-sreyly-wedding',
    authDomain: 'sovann-sreyly-wedding.firebaseapp.com',
    storageBucket: 'sovann-sreyly-wedding.firebasestorage.app',
  );

}