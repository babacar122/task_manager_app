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
    apiKey: 'AIzaSyDjZ4dqrnOQaijtGjAe30Wlkd7N5updOL4',
    appId: '1:875193232289:web:12dc9f0b57c63e146a39e0',
    messagingSenderId: '875193232289',
    projectId: 'my-task-manager233',
    authDomain: 'my-task-manager233.firebaseapp.com',
    storageBucket: 'my-task-manager233.appspot.com',
    measurementId: 'G-0KK05BJ6VL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXlGTAk0cgRxv9VDBlwWwuun5gl8S4yeo',
    appId: '1:875193232289:android:392db7d30559df546a39e0',
    messagingSenderId: '875193232289',
    projectId: 'my-task-manager233',
    storageBucket: 'my-task-manager233.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiyWRMtw_UsRZqla_eP4zYEBghI7TyQ38',
    appId: '1:875193232289:ios:28c95e561c276e416a39e0',
    messagingSenderId: '875193232289',
    projectId: 'my-task-manager233',
    storageBucket: 'my-task-manager233.appspot.com',
    iosBundleId: 'com.example.taskManagerApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBiyWRMtw_UsRZqla_eP4zYEBghI7TyQ38',
    appId: '1:875193232289:ios:28c95e561c276e416a39e0',
    messagingSenderId: '875193232289',
    projectId: 'my-task-manager233',
    storageBucket: 'my-task-manager233.appspot.com',
    iosBundleId: 'com.example.taskManagerApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDjZ4dqrnOQaijtGjAe30Wlkd7N5updOL4',
    appId: '1:875193232289:web:9444a5dd35f457bb6a39e0',
    messagingSenderId: '875193232289',
    projectId: 'my-task-manager233',
    authDomain: 'my-task-manager233.firebaseapp.com',
    storageBucket: 'my-task-manager233.appspot.com',
    measurementId: 'G-KEVYWKSRBS',
  );

}