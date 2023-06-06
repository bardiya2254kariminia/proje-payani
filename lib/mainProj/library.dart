import 'package:flutter/material.dart';
import 'package:main2/mainProj/infoPage.dart';
import 'package:main2/maked_Widget/makedWidget.dart';

void main() => runApp(const Library());

class Library extends StatefulWidget {
  const Library({super.key});

  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          drawer: const myDrawer(),
          backgroundColor: Colors.blue[50],
          appBar: AppBar(
            backgroundColor: Colors.blue,
            centerTitle: true,
            title: const Text(
              "Library",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            bottom: const TabBar(
              dividerColor: Colors.white,
              tabs: [
                Tab(
                  icon: Text("Ebooks"),
                ),
                Tab(
                  icon: Text("Audiobooks"),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Ebook(),
              AudioBook(),
              // Text(";kefnvlef v")
            ],
          ),
        ),
      ),
    );
  }
}

class Ebook extends StatefulWidget {
  const Ebook({super.key});

  @override
  State<Ebook> createState() => _EbookState();
}

class _EbookState extends State<Ebook> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            myEbooks(),
            SizedBox(
              height: 5,
            ),
            myEbooks(),
            SizedBox(
              height: 5,
            ),
            myEbooks(),
            SizedBox(
              height: 5,
            ),
            myEbooks(),
            SizedBox(
              height: 5,
            ),
            myEbooks(),
            SizedBox(
              height: 5,
            ),
            myEbooks(),
            SizedBox(
              height: 5,
            ),
            myEbooks(),
            SizedBox(
              height: 5,
            ),
            myEbooks(),
            SizedBox(
              height: 5,
            ),
            myEbooks(),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class AudioBook extends StatefulWidget {
  const AudioBook({super.key});

  @override
  State<AudioBook> createState() => _AudioBookState();
}

class _AudioBookState extends State<AudioBook> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            myEbooks(),
            SizedBox(
              height: 5,
            ),
            myEbooks(),
            SizedBox(
              height: 5,
            ),
            myEbooks(),
            SizedBox(
              height: 5,
            ),
            myEbooks(),
            SizedBox(
              height: 5,
            ),
            myEbooks(),
            SizedBox(
              height: 5,
            ),
            myEbooks(),
            SizedBox(
              height: 5,
            ),
            myEbooks(),
            SizedBox(
              height: 5,
            ),
            myEbooks(),
            SizedBox(
              height: 5,
            ),
            myEbooks(),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}

class myEbooks extends StatelessWidget {
  const myEbooks({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => infoPage(Name: "name",),
          ),
        );
      },
      child: Container(
        height: height / 7,
        width: width,
        decoration: BoxDecoration(
          color: Colors.blue[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("asset/ganesha-reading-book-wallpaper-1.jpg"),
            Container(
              margin: const EdgeInsets.only(left: 10),
              width: width / 2,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  Text(
                    "autor",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
