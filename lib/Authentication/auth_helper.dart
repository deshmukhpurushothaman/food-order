import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
// import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthHelper {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static signInWithEmail(
      {required String email, required String password}) async {
    try {
      final res = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // final User? user = res.user;
      QuerySnapshot user = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: res.user!.email)
          .get();
      return user.docs[0].data() as Map<String, dynamic>;
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      if (e.code == 'user-not-found') {
        Fluttertoast.showToast(msg: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Fluttertoast.showToast(msg: "Incorrect Password!!!");
      }
    }
  }

  static signUpWithEmail({
    required String email,
    required String password,
    required String name,
    required String company,
  }) async {
    try {
      final res = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      print("${res.user}");
      FirebaseFirestore.instance
          .collection('users')
          .doc(res.user?.uid)
          .set({"name": name, "company": company, "email": email, "role": 0});
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      if (e.code == 'email-already-in-use') {
        Fluttertoast.showToast(
            msg:
                'The email address is already in use by another account. Sign up with another Email ID.');
      }
    }
    //final User user = res.user;
    //return user;
  }

  // static signInWithGoogle() async {
  //   GoogleSignIn googleSignIn = GoogleSignIn();
  //   final acc = await googleSignIn.signIn();
  //   final auth = await acc.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //       accessToken: auth.accessToken, idToken: auth.idToken);
  //   final res = await _auth.signInWithCredential(credential);
  //   return res.user;
  // }

  static logOut() {
    //  GoogleSignIn().signOut();
    return _auth.signOut();
  }
}

class UserHelper {
  static FirebaseFirestore _db = FirebaseFirestore.instance;

  static saveUser(User? user) async {
    Map<String, dynamic> userData = {
      "name": user!.displayName,
      "email": user.email,
      // "company":  user.company,
      "last_login": user.metadata.creationTime!.millisecondsSinceEpoch,
      "role": "0",
    };
    final userRef = _db.collection("users").doc(user.uid);
    if ((await userRef.get()).exists) {
      await userRef.update({
        "last_login": user.metadata.lastSignInTime!.millisecondsSinceEpoch,
      });
    } else {
      await userRef.set(userData);
    }
  }
}
