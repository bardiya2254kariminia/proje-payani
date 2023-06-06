// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
      home: Scaffold(
        backgroundColor: Colors.blue[50],
        appBar: AppBar(
          backgroundColor: Colors.blue,
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
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 40),
              width: double.infinity,
              child: Image.asset(
                "asset/ganesha-reading-book-wallpaper-1.jpg",
              ),
            ),
          ),
          Container(
            // margin: const EdgeInsets.only(left: 5, right: 5),
            width: double.infinity,
            height: height / 5,
            decoration: BoxDecoration(
              color: Colors.blue[200],
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
                        onPressed: () {},
                        child: const Icon(
                          opticalSize: 30,
                          Icons.bookmark_add_outlined,
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
                        child: const Text(
                          "Purchase",
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ),
                    Container(
                      height: height / 12,
                      margin: EdgeInsets.only(left: width / 20),
                      child: ElevatedButton(
                          onPressed: () {}, child: const Icon(Icons.star_rate)
                          // Color: Colors.black,
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
                    style: const ButtonStyle(),
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
                    style: ButtonStyle(),
                    onPressed: () {},
                    child: const Text("App view"),
                  ),
                ),
                // IconButton(
                //     onPressed: () {},
                //     icon: const Text(
                //       "Special",
                //       style: TextStyle(color: Colors.white, fontSize: 10),
                //     )
                //     // Color: Colors.black,
                //     ),
              ],
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   height: height,
          //   child: const Center(
          //     child: Column(
          //       children: [],
          //     ),
          //   ),
          // )
          const SizedBox(
            height: 10,
          ),

          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              height: 200,
              width: 300,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
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
              color: Colors.blue,
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
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          minLines: 6,
                          decoration: InputDecoration(
                            hintText: 'Review',
                            contentPadding: const EdgeInsets.all(15),
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
                          onPressed: () {},
                          child: const Text(
                            "Submit Review",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  ),
                  // child: request,
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
          // ListView(
          //   children: [],
          // )
        ],
      ),
    );
  }
}
