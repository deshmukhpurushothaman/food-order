import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:collection/collection.dart';
import 'package:intl/intl.dart';
import 'package:food_booking/widgets/app_drawer.dart';

class RestaurantHome extends StatefulWidget {
  const RestaurantHome({super.key});

  @override
  State<RestaurantHome> createState() => _RestaurantHomeState();
}

class _RestaurantHomeState extends State<RestaurantHome> {
  var listOfDays = [];
  var todayDate = DateFormat('yMd').format(DateTime.now());
  @override
  void initState() {
    super.initState();
    _fetchOrderDays();
  }

  void _fetchOrderDays() async {
    QuerySnapshot res = await FirebaseFirestore.instance
        .collection('orders')
        .orderBy('createdAt', descending: false)
        .get();
    setState(() {
      listOfDays.add(todayDate);
    });
    final orderLength = res.docs.length;
    for (int i = 0; i < orderLength; i++) {
      var order = res.docs[i].data() as Map<String, dynamic>;
      var recDate =
          DateFormat('yMd').format(DateTime.parse(order['createdAt']));
      print("recDate $recDate");
      if (recDate != todayDate) {
        setState(() {
          listOfDays.add(recDate);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Day",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.orange[300],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (var i in listOfDays)
            Align(
              alignment: Alignment.center,
              child: (Container(
                height: 70,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 8, top: 8),
                alignment: Alignment.center,
                // color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.orange[300],
                  border: Border.all(
                    width: 2,
                  ),
                  // borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    child: Text(
                      "${i.toString()}",
                      style: (TextStyle(color: Colors.black, fontSize: 20)),
                    ),
                  ),
                ),
              )),
            )
        ],
      ),
    );
  }
}
