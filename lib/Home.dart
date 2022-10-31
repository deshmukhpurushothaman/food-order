import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_booking/Screens/Menu.dart';
import 'package:food_booking/widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Restaurants",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.orange[300],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      // backgroundColor: Colors.orange[300],
      drawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => Menu("Restaurant 1")));
              },
              child: Container(
                height: 100,
                width: MediaQuery.of(context).size.width * 0.65,
                alignment: Alignment.center,
                // color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.orange[300],
                  border: Border.all(
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Restaurant 1",
                  style: (TextStyle(color: Colors.black, fontSize: 20)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 100,
              width: MediaQuery.of(context).size.width * 0.65,
              alignment: Alignment.center,
              // color: Colors.white,
              decoration: BoxDecoration(
                color: Colors.orange[300],
                border: Border.all(
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Restaurant 2",
                style: (TextStyle(color: Colors.black, fontSize: 20)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
