import 'package:flutter/material.dart';
import 'package:street_art_witnesses/pages/home/collection/collection_page.dart';
import 'package:street_art_witnesses/pages/home/map/map_page.dart';
import 'package:street_art_witnesses/pages/home/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 14,
        currentIndex: pageIndex,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        onTap: (value) => setState(() => pageIndex = value),
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
  CollectionPage(),
  ProfilePage(),
];
