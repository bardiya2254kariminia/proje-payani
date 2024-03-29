import 'package:flutter/material.dart';

import 'Home.dart';

void main() => runApp(signupPage());

class signupPage extends StatefulWidget {
  signupPage({super.key});

  @override
  State<signupPage> createState() => signupPageState();
}

class signupPageState extends State<signupPage> {
  final checker = GlobalKey<FormState>();
  String? username = "";
  String? password = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey,
        hintColor: const Color.fromARGB(255, 168, 196, 193),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Color.fromARGB(255, 222, 222, 222),
              ),
            )
          ],
        ),
        backgroundColor: Colors.blue[100],
        body: const signuppBody(),
      ),
    );
  }
}

class signuppBody extends StatefulWidget {
  const signuppBody({super.key});

  @override
  State<signuppBody> createState() => _signuppBody();
}

class _signuppBody extends State<signuppBody> {
  final checker = GlobalKey<FormState>();
  final textFieldFocusNode = FocusNode();
  bool _obscured = true;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    String? username;
    String? password;
    String? email;
    bool passwordObscure = false;

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(5),
        height: height / 1.5,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(20)),
        child: SingleChildScrollView(
          child: Form(
            key: checker,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.05,
                ),
                Text(
                  "sign up",
                  style: TextStyle(color: Colors.blue[100], fontSize: 25),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                SizedBox(
                  width: 280,
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: TextFormField(
                      cursorHeight: 23,
                      ///////////////////////////////user
                      style: TextStyle(color: Colors.blue[100]),
                      decoration: InputDecoration(
                        icon: const Icon(Icons.person),
                        // hintText: "username or email",
                        labelText: "username",
                        labelStyle: TextStyle(
                          color: Colors.blue[100],
                        ),
                        iconColor: Colors.blue[100],
                        fillColor: Colors.blue[100],
                      ),

                      onChanged: (String? newValue) {
                        setState(() {
                          username = newValue;
                        });
                      },
                      validator: (value) {
                        // String userStr = username ?? "";
                        if (value == null || value.isEmpty) {
                          return "fill it correctly";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                SizedBox(
                  width: 280,
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: TextFormField(
                      cursorHeight: 23,
                      obscureText: _obscured,

                      ///////////////////////////////password
                      style: TextStyle(
                        color: Colors.blue[100],
                      ),
                      decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        // hintText: "password",
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                          child: GestureDetector(
                            onTap: _toggleObscured,
                            child: Icon(
                              _obscured
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                              size: 24,
                            ),
                          ),
                        ),
                        labelText: "password",
                        labelStyle: TextStyle(color: Colors.blue[100]),
                        iconColor: Colors.blue[100],
                        fillColor: Colors.blue[100],
                      ),

                      onChanged: (String? newValue) {
                        setState(
                          () {
                            password = newValue;
                          },
                        );
                      },

                      validator: (value) {
                        // String userStr = username ?? "";
                        if (value == null ||
                            value!.length < 8 ||
                            !RegExp('[0-9]').hasMatch(value!) ||
                            !RegExp('[a-z]').hasMatch(value!) ||
                            !RegExp('[A-Z]').hasMatch(value!)) {
                          //halat ghalat
                          return "your password must have \n  one upper/lower letter\n number and \n mustbe more than 8 character";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                SizedBox(
                  width: 280,
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: TextFormField(
                      ///////////////////////////////email
                      style: TextStyle(color: Colors.blue[100]),
                      cursorHeight: 23,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.email),
                        // hintText: "email",
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.blue[100]),
                        iconColor: Colors.blue[100],
                        fillColor: Colors.blue[100],
                      ),

                      onChanged: (String? newValue) {
                        setState(
                          () {
                            email = newValue;
                          },
                        );
                      },

                      validator: (value) {
                        // String userStr = username ?? "";
                        if (value == null || !value.contains("@gmail.com")) {
                          //halat ghalat
                          return "must enter a email";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue[100],
                  ),
                  onPressed: () {
                    if (!checker.currentState!.validate()) {
                      const snackBar =
                          SnackBar(content: Text("submitting form"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Home(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "next",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
