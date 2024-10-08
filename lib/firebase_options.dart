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
    apiKey: 'AIzaSyA3mhDaih7uZw-Kl-MSxPOz6lXBMMLlCHc',
    appId: '1:1080797518811:web:1e7baf03a6652a20abe5fe',
    messagingSenderId: '1080797518811',
    projectId: 'inventory-management-fuais',
    authDomain: 'inventory-management-fuais.firebaseapp.com',
    storageBucket: 'inventory-management-fuais.appspot.com',
    measurementId: 'G-M5W72E2FCF',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB325QE8CgDTs5uNjmjJHHYulkNyNK3sIk',
    appId: '1:1080797518811:android:2e26955de7d851c4abe5fe',
    messagingSenderId: '1080797518811',
    projectId: 'inventory-management-fuais',
    storageBucket: 'inventory-management-fuais.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDGR9JzGh3aykqgXvxkWt8YsqNcFpXGRRQ',
    appId: '1:1080797518811:ios:43efdd9c1045cf4aabe5fe',
    messagingSenderId: '1080797518811',
    projectId: 'inventory-management-fuais',
    storageBucket: 'inventory-management-fuais.appspot.com',
    iosClientId: '1080797518811-qa8ihl4iog4s7sfvcqfi08uo6gp0vojp.apps.googleusercontent.com',
    iosBundleId: 'com.example.inventoryManagemenFuais',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDGR9JzGh3aykqgXvxkWt8YsqNcFpXGRRQ',
    appId: '1:1080797518811:ios:62ccd896969e29faabe5fe',
    messagingSenderId: '1080797518811',
    projectId: 'inventory-management-fuais',
    storageBucket: 'inventory-management-fuais.appspot.com',
    iosClientId: '1080797518811-16lalk4n69l2f7sj5u0cbin3ntmh0eu2.apps.googleusercontent.com',
    iosBundleId: 'com.example.inventoryManagemenFuais.RunnerTests',
  );
}
