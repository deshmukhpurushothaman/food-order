import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'Start.dart';
import 'package:flutter/cupertino.dart';
import 'Authentication/auth_helper.dart';
import 'Authentication/signup.dart';
import 'package:flutter/material.dart';
import 'Authentication/login.dart';
// import 'carousal.dart';
// import 'NewPage.dart';
import 'home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print("Main.dart");
  String token123;
  @override
  void initState() {
    print("Main.dart initstate");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // @override
  String token123 = '';
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Order',
      theme: ThemeData(
        // fontFamily: "poppins",
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            UserHelper.saveUser(snapshot.data);
            return StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(snapshot.data!.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  final userDoc = snapshot.data;
                  print("User data");
                  print(snapshot.data);
                  final user = userDoc!["role"];
                  print("User $user");
                  // if (user == '1') {
                  //   return createpost();
                  // } else if (user == '2') {
                  //   print("Super admin");
                  //   return AdminHome();
                  // } else {
                  //   //return NewPage();
                  //   return HomePage();
                  // }
                  return HomePage();
                } else {
                  return Material(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            );
          }
          return Start();
        });
    // return Start();
  }
}
