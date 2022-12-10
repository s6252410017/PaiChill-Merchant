import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:location/location.dart';

class GoogleServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();
  final _storage = FirebaseStorage.instance;


  googleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
       // await _auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  // facebookSignIn() async {
  //   final LoginResult result = await FacebookAuth.instance.login();
  //   if (result.status == LoginStatus.success) {
  //     final token = result.accessToken;
  //     print(token);
  //     final userData = await FacebookAuth.instance.getUserData();
  //     print(userData);
  //   } else {
  //     print(result.status);
  //     print(result.message);
  //   }
  // }

  getsubcollections() async {
    await FirebaseFirestore.instance
        .collection("shop_account")
        .get()
        .then((value) {
      value.docs.forEach((result) {
        FirebaseFirestore.instance
            .collection("shop_account")
            .doc(result.id)
            .collection('shop_feedback')
            .get()
            .then((subcallection) {
          subcallection.docs.forEach((datasubcallection) {
            print(datasubcallection);
          });
        });
      });
    });
  }

  uploadFirebaseStorage(String filePath, String fileName) async {
    File file = File(filePath);
    String urlPic = '';
    try {
      final _storageref = _storage.ref('user_image/${fileName}');
      final uploadTask = _storageref.putFile(file);

      final uploadSuc = await uploadTask.whenComplete(() => {});
      final urlPic = await uploadSuc.ref.getDownloadURL();
      return urlPic;
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
      print('LogOut Success');
    } on FirebaseException catch (e) {
      print(e.message);
    }
  }
}
