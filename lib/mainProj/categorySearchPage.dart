// ignore_for_file: camel_case_types, must_be_immutable, unused_local_variable

import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:main2/mainProj/infoPage.dart';
import 'package:main2/maked_Widget/makedWidget.dart';

void main() => runApp(categorySearchPage(name: "name"));

class categorySearchPage extends StatefulWidget {
  String name;
  categorySearchPage({Key? key, required this.name}) : super(key: key);

  @override
  State<categorySearchPage> createState() => _categorySearchPageState();
}

class _categorySearchPageState extends State<categorySearchPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text(
            widget.name,
            style: const TextStyle(fontSize: 30, color: Colors.white),
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
        drawer: const myDrawer(),
        body: const SingleChildScrollView(
          child: myCategorySearchPage(),
        ),
      ),
    );
  }
}

//// baed inke inja esm category ro gereft miam esm ro pas midam va az kol on ketaba ro neshon midam
class myCategorySearchPage extends StatefulWidget {
  const myCategorySearchPage({super.key});

  @override
  State<myCategorySearchPage> createState() => _myCategorySearchPageState();
}

class _myCategorySearchPageState extends State<myCategorySearchPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    String searchValue;
    List<String>? examples = [
      'shekarestan',
      'shahname',
      'qaaa',
      'aaa',
      'aaaa',
      'aaaa',
      'aaaa'
    ];
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Scaffold(
              appBar: EasySearchBar(
                backgroundColor: const Color.fromARGB(255, 16, 82, 137),
                iconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                searchClearIconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 16, 82, 137),
                ),
                searchTextStyle: const TextStyle(
                  color: Color.fromARGB(255, 16, 82, 137),
                ),
                searchCursorColor: const Color.fromARGB(255, 16, 82, 137),
                searchBackIconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 16, 82, 137),
                ),
                title: const Text(
                  "Search",
                  style: TextStyle(color: Colors.white),
                ),
                suggestions: examples,
                suggestionsElevation: 10,
                ////////////////////////////////////////////

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
                /////////////////////////////////////////////////////////
                onSuggestionTap: (data) {
                  setState(
                    () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => infoPage(
                            Name: data,
                          ),
                        ),
                      );
                    },
                  );
                },
                onSearch: (value) {
                  setState(
                    () {
                      searchValue = value;
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
