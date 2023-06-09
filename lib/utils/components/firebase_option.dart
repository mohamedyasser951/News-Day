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
      // case TargetPlatform.iOS:
      //   return ios;
      // case TargetPlatform.macOS:
      //   return macos;
      case TargetPlatform.windows:
        return web;
      // throw UnsupportedError(
      //   'DefaultFirebaseOptions have not been configured for windows - '
      //   'you can reconfigure this by running the FlutterFire CLI again.',
      // );
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
      apiKey: "AIzaSyAB0lqLiHdNLJ2U8z5xidruZVodSGZPtn4",
      authDomain: "newshour-461fe.firebaseapp.com",
      databaseURL: "https://newshour-461fe-default-rtdb.firebaseio.com",
      projectId: "newshour-461fe",
      storageBucket: "newshour-461fe.appspot.com",
      messagingSenderId: "145487676681",
      appId: "1:145487676681:web:6302bc8d18bfcac2ebffd8");

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBVvtz_-HHtCee0ALz6H9M4p5cxJef0HUs',
    appId: '1:145487676681:android:d423c935234513a9ebffd8',
    messagingSenderId: '145487676681',
    projectId: 'newshour-461fe',
    storageBucket: 'newshour-461fe.appspot.com',
  );

  // static const FirebaseOptions ios = FirebaseOptions(
  //   apiKey: 'AIzaSyA0KcldlqzxxVyl5Zu1GH_kJn3LP3j4sZw',
  //   appId: '1:118409035301:ios:c8114b6e00018e0b64c9cc',
  //   messagingSenderId: '118409035301',
  //   projectId: 'social-app-a6a3a',
  //   storageBucket: 'social-app-a6a3a.appspot.com',
  //   iosClientId: '118409035301-9malhordq0j0185nna7a1fmvsg0l5tvi.apps.googleusercontent.com',
  //   iosBundleId: 'com.example.socialApp',
  // );

  // static const FirebaseOptions macos = FirebaseOptions(
  //   apiKey: 'AIzaSyA0KcldlqzxxVyl5Zu1GH_kJn3LP3j4sZw',
  //   appId: '1:118409035301:ios:c8114b6e00018e0b64c9cc',
  //   messagingSenderId: '118409035301',
  //   projectId: 'social-app-a6a3a',
  //   storageBucket: 'social-app-a6a3a.appspot.com',
  //   iosClientId: '118409035301-9malhordq0j0185nna7a1fmvsg0l5tvi.apps.googleusercontent.com',
  //   iosBundleId: 'com.example.socialApp',
  // );
}
