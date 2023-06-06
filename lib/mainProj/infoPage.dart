// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:main2/Book_Audio.dart/theme.dart';
import 'package:main2/mainProj/payPal.dart';
import 'package:main2/maked_Widget/makedWidget.dart';

// import 'package:in_app_review/in_app_review.dart';
void main() => runApp(
      const infoPage(
        Name: "Name",
      ),
    );

class infoPage extends StatefulWidget {
  final String Name;
  const infoPage({Key? key, required this.Name}) : super(key: key);

  @override
  State<infoPage> createState() => _infoPageState();
}

class _infoPageState extends State<infoPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightDarkTheme.getTheme(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Book Sight",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_sharp),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: myInfo(Name: widget.Name),
        ),
        drawer: const myDrawer(),
      ),
    );
  }
}

class myInfo extends StatefulWidget {
  final String Name;
  const myInfo({Key? key, required this.Name}) : super(key: key);

  @override
  State<myInfo> createState() => _myInfoState();
}

class _myInfoState extends State<myInfo> {
  bool likedbool = false;
  bool isread = false;
  bool doesPurchased = true;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: height / 30,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
            width: double.infinity,
            child: Image.asset(
              "asset/ganesha-reading-book-wallpaper-1.jpg",
            ),
          ),
          Container(
            width: double.infinity,
            height: height / 5,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.blue[200]
                  : Colors.black,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.Name,
                  style: const TextStyle(fontSize: 25),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  widget.Name,
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: width / 20),
                      height: height / 12,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            likedbool = !likedbool;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              likedbool == false ? Colors.white : Colors.red),
                          iconColor: MaterialStatePropertyAll(
                              likedbool == false ? Colors.blue : Colors.white),
                        ),
                        child: const Icon(
                          opticalSize: 30,
                          Icons.favorite,
                          size: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: width / 2,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PayPal(fee: "fee"),
                            ),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).brightness == Brightness.light
                                ? Colors.blue
                                : const Color.fromARGB(255, 58, 58, 58),
                          ),
                        ),
                        child: const Text(
                          "Purchase",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                    Container(
                      height: height / 12,
                      margin: EdgeInsets.only(left: width / 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.light
                            ? Colors.blue
                            : const Color.fromARGB(255, 58, 58, 58),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            "3.4",
                            style:
                                TextStyle(color: Colors.yellow, fontSize: 20),
                          ),
                          Icon(
                            Icons.star_rate,
                            color: Colors.yellow,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 50,
            width: width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                  width: (width) / 3,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).brightness == Brightness.light
                            ? Colors.blue
                            : const Color.fromARGB(255, 58, 58, 58),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Download"),
                  ),
                ),
                SizedBox(
                  width: width / 20,
                ),
                SizedBox(
                  height: 50,
                  width: (width) / 3,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).brightness == Brightness.light
                            ? Colors.blue
                            : const Color.fromARGB(255, 58, 58, 58),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("App view"),
                  ),
                ),
              ],
            ),
          ),
          doesPurchased == true
              ? Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: width / 2,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isread = !isread;
                          });
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            isread == false
                                ? const Color.fromARGB(255, 210, 209, 209)
                                : Colors.amber,
                          ),
                        ),
                        child: isread == false
                            ? const Text("Not Read")
                            : const Text("Read"),
                      ),
                    ),
                  ],
                )
              : const SizedBox(
                  height: 1,
                ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.blue
                  : Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: 200,
              width: 300,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey[200]
                    : const Color.fromARGB(255, 91, 91, 91),
                borderRadius: BorderRadius.circular(10),
              ),
              // child:
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.blue
                  : Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Rating",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                SizedBox(
                  height: height / 20,
                ),
                RatingBar.builder(
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 12.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  onRatingUpdate: (rating) {},
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Review",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: height / 3,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 232, 232, 232),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: 6,
                              minLines: 6,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: 'Review',
                                hintStyle: const TextStyle(
                                    color: Color.fromARGB(255, 224, 224, 224)),
                                contentPadding: const EdgeInsets.all(15),
                                hoverColor: Colors.black,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            height: 60,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                  Theme.of(context).brightness ==
                                          Brightness.light
                                      ? Colors.blue
                                      : const Color.fromARGB(255, 58, 58, 58),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                "Submit Review",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          CategoryList(
            name: "Reviews",
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
