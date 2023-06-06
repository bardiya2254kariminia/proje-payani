import 'package:flutter/material.dart';

void main() => runApp(const editProfileInfo());

class editProfileInfo extends StatefulWidget {
  const editProfileInfo({super.key});

  @override
  State<editProfileInfo> createState() => _editProfileInfoState();
}

class _editProfileInfoState extends State<editProfileInfo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        hintColor: const Color.fromARGB(255, 168, 196, 193),
      ),
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            "Editing profile",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: const MyEditBody(),
      ),
    );
  }
}

class MyEditBody extends StatefulWidget {
  const MyEditBody({super.key});

  @override
  State<MyEditBody> createState() => _MyEditBodyState();
}

class _MyEditBodyState extends State<MyEditBody> {
  final checker = GlobalKey<FormState>();
  String? username;
  String? password;
  String? email;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(5),
        height: height / 2,
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
                SizedBox(
                  width: 280,
                  child: Container(
                    margin: const EdgeInsets.only(right: 20),
                    child: TextFormField(
                      cursorHeight: 23,
                      ///////////////////////////////user
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        // hintText: "username or email",
                        labelText: "username",
                        labelStyle: TextStyle(color: Colors.white),
                        iconColor: Colors.white,
                        fillColor: Colors.white,
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
                      ///////////////////////////////password
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        // hintText: "password",
                        labelText: "password",
                        labelStyle: TextStyle(color: Colors.white),
                        iconColor: Colors.white,
                        fillColor: Colors.white,
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
                            value.length < 8 ||
                            !RegExp('[0-9]').hasMatch(value) ||
                            !RegExp('[a-z]').hasMatch(value) ||
                            !RegExp('[A-Z]').hasMatch(value)) {
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
                      style: const TextStyle(color: Colors.white),
                      cursorHeight: 23,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        // hintText: "email",
                        labelText: "Email",
                        labelStyle: TextStyle(color: Colors.white),
                        iconColor: Colors.white,
                        fillColor: Colors.white,
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
                    primary: Colors.white,
                  ),
                  onPressed: () {
                    if (!checker.currentState!.validate()) {
                    } else {
                      Navigator.of(context).pop();
                      const snackBar = SnackBar(content: Text("Info Changed"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: const Text(
                    "Submit",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                const SizedBox(
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
