import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA7aJsv35Q2hAMjgs5pFrAlc5TuPLgft1Q",
            authDomain: "board-39658.firebaseapp.com",
            projectId: "board-39658",
            storageBucket: "board-39658.appspot.com",
            messagingSenderId: "787007204161",
            appId: "1:787007204161:web:50198ff2f2f3d150278fc0"));
  } else {
    await Firebase.initializeApp();
  }
}
