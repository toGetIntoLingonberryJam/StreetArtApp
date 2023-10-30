import 'package:flutter/material.dart';
import 'package:street_art_witnesses/pages/home/collection/collection_page.dart';
import 'package:street_art_witnesses/pages/home/map/map_page.dart';
import 'package:street_art_witnesses/pages/home/profile/profile_page.dart';
import 'package:street_art_witnesses/pages/home/tours/tours_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 3;
  late final PageController pageController = PageController(
    initialPage: pageIndex,
  );

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        currentIndex: pageIndex,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        onTap: (newIndex) => setState(() {
          pageIndex = newIndex;
          pageController.jumpToPage(pageIndex);
        }),
        items: _navbarItems,
      ),
    );
  }
}

const _navbarItems = [
  BottomNavigationBarItem(
    label: 'Карта',
    icon: Icon(Icons.map),
    // activeIcon: Icon(Icons.map),
  ),
  BottomNavigationBarItem(
    label: 'Экскурсии',
    icon: Icon(Icons.directions_walk),
    // activeIcon: Icon(Icons.favorite),
  ),
  BottomNavigationBarItem(
    label: 'Коллекция',
    icon: Icon(Icons.favorite),
    // activeIcon: Icon(Icons.favorite),
  ),
  BottomNavigationBarItem(
    label: 'Профиль',
    icon: Icon(Icons.person),
    // activeIcon: Icon(Icons.person),
  ),
];

const _pages = [
  MapPage(),
  ToursPage(),
  CollectionPage(),
  ProfilePage(),
];
