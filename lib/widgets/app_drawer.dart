import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_booking/Screens/create_user.dart';
import 'package:food_booking/Start.dart';
import '../Authentication/auth_helper.dart';

class AppDrawer extends StatelessWidget {
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome!',
                ),
                Visibility(
                  visible: true,
                  child: Text(
                    '${user!.email}',
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.orange[300],
            automaticallyImplyLeading: false,
          ),
          Stack(
            children: <Widget>[
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Container(
              //     height: 80,
              //     width: 80,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         image: DecorationImage(
              //             image: AssetImage('images/avatar.png'))),
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     user!.email!,
              //     style: const TextStyle(
              //         color: Colors.black,
              //         fontSize: 16.0,
              //         backgroundColor: Colors.orangeAccent),
              //     maxLines: 2,
              //   ),
              // ),
              // Align(
              //   alignment: Alignment.center + Alignment(0, .4),
              //   child: Padding(
              //       padding: EdgeInsets.only(left: 70),
              //       child: Text(
              //         'Flat No.A124',
              //         style: TextStyle(
              //           color: Colors.white,
              //         ),
              //       )),
              // ),
            ],
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.man_rounded),
            title: const Text('Create user'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (context) => CreateUser()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.of(context)
              //     .pushReplacementNamed(UserProductsScreen.routeName);
              Navigator.of(context).pushReplacement(
                  new MaterialPageRoute(builder: (context) => Start()));
              AuthHelper.logOut();
            },
          ),
        ],
      ),
    );
  }
}
