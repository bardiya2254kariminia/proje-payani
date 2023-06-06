import 'package:flutter/material.dart';
import 'package:main2/mainProj/shop.dart';
import 'package:main2/maked_Widget/makedWidget.dart';

void main() => runApp(const Home());

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: const Text(
              "Book Sight",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          backgroundColor: Colors.blue[100],
          drawer: const myDrawer(),
          body: HomeBody(),
        ),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SlideCategory(name: "Last views"),
            SizedBox(
              width: width,
              height: height,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                home: Scaffold(
                  backgroundColor: Colors.blue[100],
                  appBar: AppBar(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                    ),
                    title: const Text(
                      "Trends",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    bottom: const TabBar(
                      tabs: [
                        Tab(icon: Text("Ebooks")),
                        Tab(icon: Text("Audiobooks")),
                      ],
                    ),
                  ),
                  body: const TabBarView(
                    children: [
                      HomeEbook(),
                      HomeAudioBook(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeEbook extends StatelessWidget {
  const HomeEbook({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SlideCategory(name: "Favorites"),
            const SizedBox(
              height: 5,
            ),
            SlideCategory(name: "Top selling"),
            const SizedBox(
              height: 5,
            ),
            SlideCategory(name: "New Release"),
          ],
        ),
      ),
    );
  }
}

class HomeAudioBook extends StatelessWidget {
  const HomeAudioBook({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SlideCategory(name: "Favorites"),
            const SizedBox(
              height: 5,
            ),
            SlideCategory(name: "Top selling"),
            const SizedBox(
              height: 5,
            ),
            SlideCategory(name: "New Release"),
          ],
        ),
      ),
    );
  }
}
