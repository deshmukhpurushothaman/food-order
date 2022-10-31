// import 'forgot-password.dart';
import 'package:food_booking/Home.dart';
import 'package:food_booking/Screens/RestaurantHome.dart';
import 'package:food_booking/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'signup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'auth_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'social.dart';

bool isHiddenPassword = true;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  static FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   margin: const EdgeInsets.only(top: 15.0, left: 30.0),
              //   child: Align(
              //       alignment: Alignment.topLeft,
              //       child: Image.asset("images/login.png",
              //           height: 200, width: 200)),
              // ),
              Container(
                height: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 40.0, top: 40.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ))),
                    Container(
                        padding: const EdgeInsets.only(left: 60.0, top: 40.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Email",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400),
                            ))),
                    Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      padding: const EdgeInsets.only(left: 40.0, right: 20.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF7Fb539)),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 60.0, top: 40.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w400),
                            ))),
                    Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      padding: const EdgeInsets.only(left: 40.0, right: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: isHiddenPassword,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF7Fb539)),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF7Fb539)),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF7Fb539)),
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: Icon(isHiddenPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                isHiddenPassword = !isHiddenPassword;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //     padding: const EdgeInsets.only(right: 60.0, top: 20.0),
                    //     child: Align(
                    //         alignment: Alignment.topRight,
                    //         child: InkWell(
                    //           onTap: () {
                    //             Navigator.of(context).push(
                    //                 new MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         ForgotPasswordPage()));
                    //           },
                    //           child: Text(
                    //             "Forgot Password?",
                    //             style: TextStyle(
                    //                 color: Colors.grey,
                    //                 fontSize: 15.0,
                    //                 fontWeight: FontWeight.w400),
                    //           ),
                    //         ))),
                    SizedBox(
                      height: 20,
                    ),
                    ButtonTheme(
                        minWidth: 300.0,
                        height: 50.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.orange),
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(
                                  fontSize: 20, color: Colors.white),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Fields cannot be empty!!");
                              print("Email and password cannot be empty");
                              return;
                            }
                            try {
                              final user = await AuthHelper.signInWithEmail(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                              if (user != null) {
                                Fluttertoast.showToast(msg: "Login Successful");
                                if (user['role'] == 1) {
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              RestaurantHome()));
                                }
                                // Employees
                                else {
                                  Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (context) => HomePage()));
                                }
                              }
                            } catch (e) {
                              print(e);
                              // Fluttertoast.showToast(msg: e.message);
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        )),

                    SizedBox(
                      height: 20.0,
                    ),
                    // Container(
                    //     padding: const EdgeInsets.only(top: 20.0),
                    //     child: Align(
                    //         alignment: Alignment.center,
                    //         child: InkWell(
                    //           onTap: () {
                    //             Navigator.of(context).push(
                    //                 new MaterialPageRoute(
                    //                     builder: (context) => SignupPage()));
                    //           },
                    //           child: RichText(
                    //               text: TextSpan(
                    //                   text: "Don't have an account? ",
                    //                   style: TextStyle(
                    //                       fontSize: 15.0,
                    //                       fontWeight: FontWeight.w400,
                    //                       color: Colors.grey),
                    //                   children: <TextSpan>[
                    //                 TextSpan(
                    //                     text: 'Signup',
                    //                     style: TextStyle(
                    //                         fontSize: 15.0,
                    //                         fontWeight: FontWeight.bold,
                    //                         color: Colors.black))
                    //               ])),
                    //         ))),
                    // OrDivider(),
                    // SizedBox(
                    //   height: 20,
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.only(bottom: 20.0),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   ),
                    // )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          buildDivider(),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "Or Login With",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
          ),
          buildDivider(),
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
      child: Divider(
        color: Color(0xFFD9D9D9),
        height: 1.5,
      ),
    );
  }
}
