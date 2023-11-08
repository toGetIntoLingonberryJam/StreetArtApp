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
        showUnselectedLabels: true,
        selectedFontSize: 12,
        currentIndex: pageIndex,
        selectedItemColor: Theme.of(context).colorScheme.inverseSurface,
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
    icon: Icon(Icons.map_outlined),
  ),
  BottomNavigationBarItem(
    label: 'Экскурсии',
    icon: Icon(Icons.directions_walk),
  ),
  BottomNavigationBarItem(
    label: 'Коллекция',
    icon: Icon(Icons.favorite_outline),
  ),
  BottomNavigationBarItem(
    label: 'Профиль',
    icon: Badge(
      label: Text('1'),
      textColor: Colors.white,
      child: Icon(Icons.person_outline),
    ),
  ),
];

const _pages = [
  MapPage(),
  ToursPage(),
  CollectionPage(),
  ProfilePage(),
];
