import 'package:flutter/material.dart';
import 'package:main2/mainProj/editProfInfo.dart';
import 'package:main2/mainProj/main.dart';
import 'package:main2/mainProj/payPal.dart';

import 'package:main2/maked_Widget/makedWidget.dart';

void main() => runApp(profile());

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        hintColor: const Color.fromARGB(255, 2, 30, 53),
      ),
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            "Profile",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => log(),
                  ),
                );
              },
              child: const Icon(Icons.logout_sharp),
            )
          ],
        ),
        body: const myProfileBody(),
        drawer: const myDrawer(),
      ),
    );
  }
}

class myProfileBody extends StatefulWidget {
  const myProfileBody({super.key});

  @override
  State<myProfileBody> createState() => _myProfileBodyState();
}

class _myProfileBodyState extends State<myProfileBody> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: width * 1 / 5,
              backgroundImage: const AssetImage(
                  "asset/ganesha-reading-book-wallpaper-1.jpg"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              width: width,
              // height: 1000,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 59, 133, 193),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Account",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      SizedBox(
                        width: width / 2,
                      ),
                      SizedBox(
                        width: width / 6,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const editProfileInfo(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.change_circle,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 3,
                    color: Colors.grey[300],
                    child: ListTile(
                      leading: const Icon(
                        Icons.person,
                      ),
                      title: const Text("username"),
                      onTap: () {},
                    ),
                  ),
                  Card(
                    elevation: 3,
                    color: Colors.grey[300],
                    child: ListTile(
                      leading: const Icon(
                        Icons.lock,
                      ),
                      title: const Text("Password"),
                      onTap: () {},
                    ),
                  ),
                  Card(
                    elevation: 3,
                    color: Colors.grey[300],
                    child: ListTile(
                      leading: const Icon(
                        Icons.email,
                      ),
                      title: const Text("email"),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              width: width,
              // height: 1000,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 59, 133, 193),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width * 4 / 5,
                        child: const Text(
                          "Vallet",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: width / 5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 3,
                    color: Colors.grey[300],
                    child: ListTile(
                      leading: const Icon(
                        Icons.attach_money_sharp,
                      ),
                      title: const Text("Money"),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => const popUpMoney(),
                        );
                      },
                    ),
                  ),
                  Card(
                    elevation: 3,
                    color: Colors.grey[300],
                    child: ListTile(
                      leading: const Icon(
                        Icons.collections_bookmark_rounded,
                      ),
                      title: const Text("Sight Account"),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 5),
              width: width,
              // height: 1000,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 59, 133, 193),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: width * 4 / 5,
                        child: const Text(
                          "Properties",
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: width / 5,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    elevation: 3,
                    color: Colors.grey[300],
                    child: ListTile(
                      leading: const Icon(
                        Icons.brightness_6_outlined,
                      ),
                      title: const Text("Brightness"),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class popUpMoney extends StatefulWidget {
  const popUpMoney({super.key});

  @override
  State<popUpMoney> createState() => _popUpMoneyState();
}

class _popUpMoneyState extends State<popUpMoney> {
  var price;
  final checker = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return AlertDialog(
      title: const Text("How much Do you want to charge your account?"),
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      content: SizedBox(
        height: height / 6,
        child: Center(
          child: Column(
            children: [
              TextFormField(
                cursorHeight: 23,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  hintText: "Money",
                  labelStyle: TextStyle(color: Colors.black),
                  iconColor: Colors.black,
                  fillColor: Colors.black,
                ),
                onSaved: (String? newValue) {
                  setState(() {
                    price = newValue;
                  });
                },
                validator: (value) {
                  if (value == null) {
                    return "Must Fill";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: height / 20,
                width: width,
                child: ElevatedButton(
                  onPressed: () {
                    if (!checker.currentState!.validate()) {
                    } else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => PayPal(
                            fee: price,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text("PayPal"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
