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
    apiKey: 'AIzaSyCEhDsZoaNRk6E1rykDzwP8ipxOWdN-U8Y',
    appId: '1:105793117016:web:5719b4ece147cd3366e32d',
    messagingSenderId: '105793117016',
    projectId: 'docdiscovery-ae6c4',
    authDomain: 'docdiscovery-ae6c4.firebaseapp.com',
    storageBucket: 'docdiscovery-ae6c4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCEoFy0FoBW9C9ECgCLq9iWcurY6kFj0R0',
    appId: '1:105793117016:android:13b15f4b9092d92466e32d',
    messagingSenderId: '105793117016',
    projectId: 'docdiscovery-ae6c4',
    storageBucket: 'docdiscovery-ae6c4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD5j73fWaok-yJcZ63dXqJhjGS8zAHgP_8',
    appId: '1:105793117016:ios:8a95a0cad927f52f66e32d',
    messagingSenderId: '105793117016',
    projectId: 'docdiscovery-ae6c4',
    storageBucket: 'docdiscovery-ae6c4.appspot.com',
    iosClientId: '105793117016-v7e4k5eh41oer6lnsdr9h18er9h9c9nf.apps.googleusercontent.com',
    iosBundleId: 'com.example.docdiscovery',
  );
}
