import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:main2/Book_Audio.dart/theme.dart';
import 'package:main2/mainProj/infoPage.dart';
import 'package:main2/maked_Widget/makedWidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() => runApp(const Shop());

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightDarkTheme.getTheme(),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Shop",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            bottom: const TabBar(
              dividerColor: Colors.white,
              tabs: [
                Tab(icon: Text("Ebooks")),
                Tab(icon: Text("Audiobooks")),
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
          drawer: const myDrawer(),
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
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Scaffold(
                appBar: EasySearchBar(
                  // backgroundColor: Color.fromARGB(255, 16, 82, 137),
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  searchClearIconTheme: Theme.of(context).iconTheme,
                  searchTextStyle: TextStyle(
                    color: Theme.of(context).iconTheme.color,
                  ),
                  searchCursorColor: Theme.of(context).iconTheme.color,
                  searchBackIconTheme: Theme.of(context).iconTheme,
                  title: const Text(
                    "Search",
                    style: TextStyle(color: Colors.white),
                  ),
                  onSearch: (value) {},
                  suggestionBuilder: (value) => Card(
                    child: Container(
                      height: 40,
                      width: width,
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(value),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SlideCategory(name: "Fantasy"),
            SlideCategory(name: "Comedy"),
            SlideCategory(name: "Adventure"),
            SlideCategory(name: "Horror"),
            SlideCategory(name: "Science Fiction"),
            SlideCategory(name: "Children’s"),
            SlideCategory(name: "Health"),
            SlideCategory(name: "Romance"),
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
    final width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: Scaffold(
                appBar: EasySearchBar(
                  iconTheme: const IconThemeData(
                    color: Colors.white,
                  ),
                  searchClearIconTheme: Theme.of(context).iconTheme,
                  searchTextStyle: TextStyle(
                    color: Theme.of(context).iconTheme.color,
                  ),
                  searchCursorColor: Theme.of(context).iconTheme.color,
                  searchBackIconTheme: Theme.of(context).iconTheme,
                  title: const Text(
                    "Search",
                    style: TextStyle(color: Colors.white),
                  ),
                  onSearch: (value) {},
                  suggestionBuilder: (value) => Card(
                    child: Container(
                      height: 40,
                      width: width,
                      padding: const EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(value),
                          const SizedBox(
                            height: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SlideCategory(name: "Fantasy"),
            SlideCategory(name: "Comedy"),
            SlideCategory(name: "Adventure"),
            SlideCategory(name: "Horror"),
            SlideCategory(name: "Science Fiction"),
            SlideCategory(name: "Children’s"),
            SlideCategory(name: "Health"),
            SlideCategory(name: "Romance"),
          ],
        ),
      ),
    );
  }
}

class eachSlideCategory extends StatefulWidget {
  const eachSlideCategory({super.key});

  @override
  State<eachSlideCategory> createState() => _eachSlideCategoryState();
}

class _eachSlideCategoryState extends State<eachSlideCategory> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => infoPage(
              Name: "name",
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        height: 100,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset("asset/ganesha-reading-book-wallpaper-1.jpg"),
      ),
    );
  }
}

class SlideCategory extends StatelessWidget {
  final String name;
  SlideCategory({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        CategoryList(name: name),
        const SizedBox(
          height: 20,
        ),
        CarouselSlider.builder(
          carouselController: CarouselController(),
          itemCount: 5,
          itemBuilder: (context, index, realIndex) {
            return const eachSlideCategory();
          },
          options: CarouselOptions(
              height: height / 3,
              enableInfiniteScroll: false,
              enlargeCenterPage: true,
              pageSnapping: true),
        ),
        const SizedBox(
          height: 20,
        ),
        SmoothPageIndicator(
          controller: PageController(initialPage: 0),
          count: 5,
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
