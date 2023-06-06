import 'package:flutter/material.dart';
import 'package:main2/mainProj/library.dart';

import 'package:main2/mainProj/profile.dart';
import 'package:main2/mainProj/shop.dart';
import 'package:main2/mainProj/Home.dart';

import '../mainProj/categorySearchPage.dart';

class middleAppBar extends StatefulWidget {
  const middleAppBar({super.key});

  @override
  State<middleAppBar> createState() => _middleAppBarState();
}

class _middleAppBarState extends State<middleAppBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: AppBar(
        bottom: const TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.directions_bike),
            ),
            Tab(
              icon: Icon(
                Icons.directions_car,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryList extends StatefulWidget {
  final String name;
  const CategoryList({Key? key, required this.name}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: double.maxFinite,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.blue[300], borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: width / 10,
          ),
          SizedBox(
            width: width * 4 / 5.3,
            child: Text(
              widget.name,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => categorySearchPage(name: widget.name),
                  ),
                );
              },
              icon: const Icon(
                Icons.arrow_forward_sharp,
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class myAppBar extends StatefulWidget {
  const myAppBar({super.key});

  @override
  State<myAppBar> createState() => _myAppBarState();
}

class _myAppBarState extends State<myAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      centerTitle: true,
      title: const Text(
        "Book Sight",
        style: TextStyle(fontSize: 30, color: Colors.white),
      ),
    );
  }
}

class myDrawer extends StatelessWidget {
  const myDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 28, 85, 131),
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                "asset/ganesha-reading-book-wallpaper-1.jpg",
              ),
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              leading: const Icon(
                Icons.home,
                size: 30,
              ),
              splashColor: Colors.blue[100],
              title: const Text(
                "Home",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
              },
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              splashColor: Colors.blue[100],
              leading: const Icon(
                Icons.person,
                size: 30,
              ),
              title: const Text(
                "Profile",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const profile(),
                  ),
                );
              },
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              splashColor: Colors.blue[100],
              leading: const Icon(
                Icons.menu_book_sharp,
                size: 30,
              ),
              title: const Text(
                "Library",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Library(),
                  ),
                );
              },
            ),
          ),
          Card(
            elevation: 5,
            child: ListTile(
              splashColor: Colors.blue[100],
              leading: const Icon(
                Icons.shopping_cart_outlined,
                size: 30,
              ),
              title: const Text(
                "Shop",
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Shop(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
