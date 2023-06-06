import 'package:flutter/material.dart';
import 'signupPage.dart';

void main() => runApp(log());

class log extends StatefulWidget {
  log({super.key});

  @override
  State<log> createState() => logState();
}

class logState extends State<log> {
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
      home: logHome(),
    );
  }
}

class logHome extends StatefulWidget {
  const logHome({super.key});

  @override
  State<logHome> createState() => _logHomeState();
}

class _logHomeState extends State<logHome> {
  final checker = GlobalKey<FormState>();
  String? username = "";
  String? password = "";
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          height: height * 1 / 2,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Form(
              key: checker,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height / 20,
                    ),
                    Text(
                      "Login",
                      style: TextStyle(color: Colors.blue[100], fontSize: 25),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        ///////////////////////////////user

                        decoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          // hintText: "username or email",
                          labelText: "username",
                          iconColor: Colors.blue[100],
                          hoverColor: Colors.blue[100],
                          suffixIconColor: Colors.blue[100],
                        ),

                        cursorColor: Colors.blue[100],

                        onChanged: (String? newValue) {
                          setState(
                            () {
                              username = newValue;
                            },
                          );
                        },
                        // validator: (value) {
                        //   if (value == null || value.isEmpty||) {
                        //     return "fill it correctly";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 300,
                      child: TextFormField(
                        ///////////////////////////////password
                        decoration: InputDecoration(
                          icon: const Icon(Icons.lock),
                          // hintText: "password",
                          labelText: "password",

                          iconColor: Colors.blue[100],
                          hoverColor: Colors.blue[100],
                          suffixIconColor: Colors.blue[100],
                        ),

                        onChanged: (String? newValue) {
                          setState(
                            () {
                              password = newValue;
                            },
                          );
                        },

                        // validator: (value) {
                        //   if (value != null && value.contains("2")) {
                        //     return "false";
                        //   } else {
                        //     return null;
                        //   }
                        // },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: width * 1 / 4,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return signupPage();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "sign up",
                              style: TextStyle(color: Colors.blue[100]),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 1 / 7,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue[100],
                          ),
                          onPressed: () {
                            if (checker.currentState!.validate()) {
                              const snackBar =
                                  SnackBar(content: Text("submitting form"));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: const Text(
                            "next",
                            style: TextStyle(color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
