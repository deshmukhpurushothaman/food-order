import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _appleJuice = 0;
  int _firedRice = 0;
  int _breadOmlette = 0;
  int _briyani = 0;
  int _burger = 0;
  // int
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
              width: MediaQuery.of(context).size.width * 0.80,
              alignment: Alignment.center,
              // color: Colors.white,
              decoration: BoxDecoration(
                color: Colors.orange[300],
                border: Border.all(
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Apple Juice",
                        style: (TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _appleJuice != 0
                                    ? _appleJuice -= 1
                                    : _appleJuice = 0;
                              });
                            },
                            child: Container(
                              child: Text(
                                "-",
                                style: (TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '${_appleJuice}',
                              style: (TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _appleJuice += 1;
                              });
                            },
                            child: Container(
                              child: Text(
                                "+",
                                style: (TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
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
              height: 50,
              width: MediaQuery.of(context).size.width * 0.80,
              alignment: Alignment.center,
              // color: Colors.white,
              decoration: BoxDecoration(
                color: Colors.orange[300],
                border: Border.all(
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Fried Rice",
                        style: (TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _firedRice != 0
                                    ? _firedRice -= 1
                                    : _firedRice = 0;
                              });
                            },
                            child: Container(
                              child: Text(
                                "-",
                                style: (TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '${_firedRice}',
                              style: (TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _firedRice += 1;
                              });
                            },
                            child: Container(
                              child: Text(
                                "+",
                                style: (TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
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
              height: 50,
              width: MediaQuery.of(context).size.width * 0.80,
              alignment: Alignment.center,
              // color: Colors.white,
              decoration: BoxDecoration(
                color: Colors.orange[300],
                border: Border.all(
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Bread Omlette",
                        style: (TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _breadOmlette != 0
                                    ? _breadOmlette -= 1
                                    : _breadOmlette = 0;
                              });
                            },
                            child: Container(
                              child: Text(
                                "-",
                                style: (TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '${_breadOmlette}',
                              style: (TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _breadOmlette += 1;
                              });
                            },
                            child: Container(
                              child: Text(
                                "+",
                                style: (TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
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
              height: 50,
              width: MediaQuery.of(context).size.width * 0.80,
              alignment: Alignment.center,
              // color: Colors.white,
              decoration: BoxDecoration(
                color: Colors.orange[300],
                border: Border.all(
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Chicken Briyani",
                        style: (TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _briyani != 0 ? _briyani -= 1 : _briyani = 0;
                              });
                            },
                            child: Container(
                              child: Text(
                                "-",
                                style: (TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '${_briyani}',
                              style: (TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _briyani += 1;
                              });
                            },
                            child: Container(
                              child: Text(
                                "+",
                                style: (TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
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
              height: 50,
              width: MediaQuery.of(context).size.width * 0.80,
              alignment: Alignment.center,
              // color: Colors.white,
              decoration: BoxDecoration(
                color: Colors.orange[300],
                border: Border.all(
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Burger",
                        style: (TextStyle(color: Colors.black, fontSize: 20)),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _burger != 0 ? _burger -= 1 : _burger = 0;
                              });
                            },
                            child: Container(
                              child: Text(
                                "-",
                                style: (TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              '${_burger}',
                              style: (TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w800)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _burger += 1;
                              });
                            },
                            child: Container(
                              child: Text(
                                "+",
                                style: (TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Colors.orange),
              textStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 20, color: Colors.white),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.only(left: 30, right: 30),
              ),
            ),
            //onPressed: navigateToRegister,
            onPressed: () {
              // Navigator.of(context).push(new MaterialPageRoute(
              //     builder: (context) => SignupPage()));
            },
            child: Text(
              'Place Order',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
