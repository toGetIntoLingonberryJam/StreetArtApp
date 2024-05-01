import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/modules/home/controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    // listener: (context, state) {
    //   _pageController.jumpToPage(state.pageIndex);
    //   if (state is MainMenuMap) context.read<MapCubit>().loadMarkers();
    // },
    return GetBuilder<HomeController>(
      builder: (c) => Scaffold(
        body: PageView(
          controller: c.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: c.pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: UIColors.backgroundCard,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          currentIndex: c.pageIndex,
          selectedItemColor: UIColors.textPrimary,
          onTap: (index) => c.setPage(index),
          items: _navbarItems,
        ),
      ),
    );
  }
}

const _navbarItems = [
  BottomNavigationBarItem(
    label: 'Карта',
    icon: Icon(Icons.map_outlined),
  ),
  // BottomNavigationBarItem(
  //   label: 'Экскурсии',
  //   icon: Icon(Icons.directions_walk),
  // ),
  BottomNavigationBarItem(
    label: 'Избранное',
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
