import 'package:flutter/material.dart';
import 'package:food_booking/Screens/create_user.dart';

import '../Authentication/auth_helper.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text(
              'Welcome!',
            ),
            backgroundColor: Colors.orange[300],
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.man_rounded),
            title: Text('Create user'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                  new MaterialPageRoute(builder: (context) => CreateUser()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pop();
              // Navigator.of(context)
              //     .pushReplacementNamed(UserProductsScreen.routeName);
              AuthHelper.logOut();
            },
          ),
        ],
      ),
    );
  }
}
