import 'package:flutter/material.dart';
import '../Authentication/auth_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Home.dart';

bool isHiddenPassword = true;

class CreateUser extends StatefulWidget {
  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _companyController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: "");
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
    _companyController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create User",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.orange[500],
      ),
      backgroundColor: Colors.orange[300],
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   margin: const EdgeInsets.only(left: 20, top: 20),
              //   child: Align(
              //     alignment: Alignment.topLeft,
              //     child: Image.asset(
              //       "images/login.png",
              //       width: 200,
              //       height: 200,
              //     ),
              //   ),
              // ),
              Container(
                // height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 30.0, top: 30),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Create User",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 60, top: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Name",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      padding: const EdgeInsets.only(left: 40.0, right: 20.0),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            hintText: "Name",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 60, top: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Email",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      padding: const EdgeInsets.only(left: 40.0, right: 20.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            hintText: "Your Email Id",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 60, top: 20),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Company",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                      padding: const EdgeInsets.only(left: 40.0, right: 20.0),
                      child: TextField(
                        controller: _companyController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            hintText: "Company",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.only(left: 60, top: 20),
                    //   child: Align(
                    //     alignment: Alignment.topLeft,
                    //     child: Text(
                    //       "Contact No.",
                    //       style: TextStyle(color: Colors.black, fontSize: 20),
                    //     ),
                    //   ),
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                    //   padding: const EdgeInsets.only(left: 40.0, right: 20.0),
                    //   child: TextField(
                    //     decoration: InputDecoration(
                    //         enabledBorder: UnderlineInputBorder(
                    //           borderSide: BorderSide(color: Colors.grey),
                    //         ),
                    //         focusedBorder: UnderlineInputBorder(
                    //           borderSide: BorderSide(color: Colors.black),
                    //         ),
                    //         border: UnderlineInputBorder(
                    //           borderSide: BorderSide(color: Colors.grey),
                    //         ),
                    //         hintText: "Contact No.",
                    //         hintStyle: TextStyle(color: Colors.grey)),
                    //   ),
                    // ),
                    Container(
                        padding: const EdgeInsets.only(left: 60.0, top: 40.0),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Password",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
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
                          // color: Colors.blue,
                          onPressed: () async {
                            bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(_emailController.text);
                            if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Fields cannot be empty!!");
                              print("Email and password cannot be empty");
                              return;
                            }
                            if (!emailValid) {
                              Fluttertoast.showToast(msg: "Invalid Email!!");
                              return;
                            }
                            if (_nameController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Username cannot be empty");
                              print("Username cannot be empty");
                              return;
                            }
                            if (_companyController.text.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Company cannot be empty");
                              return;
                            }
                            if (_passwordController.text.isEmpty ||
                                _passwordController.text.length < 6) {
                              Fluttertoast.showToast(
                                  msg:
                                      "Password must contain atleast 6 letters");
                              return;
                            }
                            try {
                              final user = await AuthHelper.signUpWithEmail(
                                  name: _nameController.text,
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  company: _companyController.text);
                              if (user != null) {
                                Fluttertoast.showToast(
                                    msg: "User created successfully");
                                Navigator.pop(context);
                                Navigator.of(context).push(
                                    new MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              } else if (user == null) {
                                Fluttertoast.showToast(
                                    msg: "User with this Email already exists");
                              }
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: Text(
                            "Create",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
