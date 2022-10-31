import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Menu extends StatefulWidget {
  // const Menu({super.key});
  final String restaurantName;
  Menu(this.restaurantName);

  @override
  State<Menu> createState() => _MenuState(restaurantName);
}

class _MenuState extends State<Menu> {
  String restaurantName;
  _MenuState(this.restaurantName);
  final User? user = FirebaseAuth.instance.currentUser;
  int _appleJuice = 0;
  int _firedRice = 0;
  int _breadOmlette = 0;
  int _briyani = 0;
  int _burger = 0;
  bool isUpdate = false;
  var docId, createdAt;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchOrder();
  }

  void _onPlaceOrder() async {
    final orderData = {
      "appleJuice": _appleJuice,
      "friedRice": _firedRice,
      "breadOmlette": _breadOmlette,
      "briyani": _briyani,
      "burger": _burger,
      "createdAt": DateTime.now().toIso8601String(),
      "createdBy": user?.email,
    };
    FirebaseFirestore.instance
        .collection("orders")
        // ignore: deprecated_member_use
        .doc()
        // ignore: deprecated_member_use
        .set(orderData);
    Fluttertoast.showToast(msg: " Order placed!!");
    Navigator.pop(context);
    return;
  }

  void _onOrderUpdate() async {
    final orderData = {
      "appleJuice": _appleJuice,
      "friedRice": _firedRice,
      "breadOmlette": _breadOmlette,
      "briyani": _briyani,
      "burger": _burger,
      "updatedAt": DateTime.now().toIso8601String(),
      "createdBy": user?.email,
      "createdAt": createdAt,
    };
    FirebaseFirestore.instance
        .collection("orders")
        // ignore: deprecated_member_use
        .doc(docId)
        // .update(orderData);
        .set(orderData);
    Fluttertoast.showToast(msg: " Order updated!!");
    Navigator.pop(context);
    return;
  }

  void _fetchOrder() async {
    QuerySnapshot res = await FirebaseFirestore.instance
        .collection('orders')
        .where('createdBy', isEqualTo: user!.email)
        .orderBy('createdAt', descending: false)
        .get();
    if (res.docs.isNotEmpty) {
      final order = res.docs[0].data() as Map<String, dynamic>;
      setState(() {
        _appleJuice = order['appleJuice'];
        _firedRice = order['friedRice'];
        _breadOmlette = order['breadOmlette'];
        _briyani = order['briyani'];
        _burger = order['burger'];
        isUpdate = true;
        docId = res.docs[0].id;
        createdAt = order['createdAt'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${restaurantName}",
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
              isUpdate ? _onOrderUpdate() : _onPlaceOrder();
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
