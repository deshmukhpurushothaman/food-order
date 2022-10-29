import 'package:flutter/material.dart';
import 'Authentication/login.dart';
import 'Authentication/signup.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  navigateToLogin() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  navigateToRegister() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignupPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 35.0),
            // Container(
            //   height: 400,
            //   child: Image(
            //     image: AssetImage("images/welcome.jpg"),
            //     fit: BoxFit.contain,
            //   ),
            // ),
            SizedBox(height: 20),
            RichText(
                text: TextSpan(
                    text: 'Welcome to ',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: <TextSpan>[
                  TextSpan(
                      text: 'Food Order',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange[300]))
                ])),
            SizedBox(height: 10.0),
            Text(
              "Don't waste food!!!",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.orange),
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
                  //onPressed: navigateToLogin,
                  onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => LoginPage()));
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.orange),
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
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => SignupPage()));
                  },
                  child: Text(
                    'SIGNUP',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
