import 'package:flutter/material.dart';

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
