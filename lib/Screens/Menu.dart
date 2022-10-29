import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Food Menu",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.orange[300],
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 50,
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
                "Apple Juice",
                style: (TextStyle(color: Colors.black, fontSize: 20)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 50,
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
                "Fried Rice",
                style: (TextStyle(color: Colors.black, fontSize: 20)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 50,
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
                "Bread Omlette",
                style: (TextStyle(color: Colors.black, fontSize: 20)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 50,
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
                "Chicken Briyani",
                style: (TextStyle(color: Colors.black, fontSize: 20)),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 50,
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
                "Burger",
                style: (TextStyle(color: Colors.black, fontSize: 20)),
              ),
            ),
          )
        ],
      )),
    );
  }
}
