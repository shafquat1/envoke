import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBuZC36PHbiwLh0QJrox2gLEnx3Nh_qbzU",
            authDomain: "envoke-7dtyz3.firebaseapp.com",
            projectId: "envoke-7dtyz3",
            storageBucket: "envoke-7dtyz3.appspot.com",
            messagingSenderId: "406660215478",
            appId: "1:406660215478:web:63f3b4bf22d724a6fe2c17"));
  } else {
    await Firebase.initializeApp();
  }
}
