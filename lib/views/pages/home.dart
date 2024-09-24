import 'package:anime_database/views/pages/my_anime/my_anime_index.dart';
import 'package:anime_database/views/pages/search/search.dart';
import 'package:anime_database/views/widgets/base/base_bottom_navigation_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int currentIndex = 0;

  final List<Widget> pages = [
    const MyAnimeIndex(),
    const Search(),
  ];

  void setIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BaseBottomNavigationWidget(
        currentIndex: currentIndex,
        onTapSelected: (int index) => setIndex(index),
      ),
    );
  }
}
