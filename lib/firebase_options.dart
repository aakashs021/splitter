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
    apiKey: 'AIzaSyDzh7_gwvelPwRBco8Cg_Z88SWNIwYIpWk',
    appId: '1:169378108224:web:4cd170eb593e5d9f7060a5',
    messagingSenderId: '169378108224',
    projectId: 'splitter-22986',
    authDomain: 'splitter-22986.firebaseapp.com',
    storageBucket: 'splitter-22986.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyARChVwxkCzHnIOyb8p5bWTmXBaYn5WPEw',
    appId: '1:169378108224:android:b2dcf25b501abd607060a5',
    messagingSenderId: '169378108224',
    projectId: 'splitter-22986',
    storageBucket: 'splitter-22986.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDaNsuOwttNU1MOsoxxs0KXSE9bPF760wI',
    appId: '1:169378108224:ios:e86f11d87d3b6e067060a5',
    messagingSenderId: '169378108224',
    projectId: 'splitter-22986',
    storageBucket: 'splitter-22986.firebasestorage.app',
    iosBundleId: 'com.example.splitter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDaNsuOwttNU1MOsoxxs0KXSE9bPF760wI',
    appId: '1:169378108224:ios:e86f11d87d3b6e067060a5',
    messagingSenderId: '169378108224',
    projectId: 'splitter-22986',
    storageBucket: 'splitter-22986.firebasestorage.app',
    iosBundleId: 'com.example.splitter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDzh7_gwvelPwRBco8Cg_Z88SWNIwYIpWk',
    appId: '1:169378108224:web:a0202da5d77e76d47060a5',
    messagingSenderId: '169378108224',
    projectId: 'splitter-22986',
    authDomain: 'splitter-22986.firebaseapp.com',
    storageBucket: 'splitter-22986.firebasestorage.app',
  );
}