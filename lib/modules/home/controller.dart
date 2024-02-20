import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/collection_page.dart';
import 'package:street_art_witnesses/modules/home/modules/map/screen.dart';
import 'package:street_art_witnesses/modules/user/screen.dart';

class HomeController extends GetxController {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  late final pageController = PageController(
    initialPage: _pageIndex,
  );
  final pages = [const MapScreen(), const CollectionPage(), const ProfileScreen()];

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void setPage(int index) {
    if (index < 0 || index >= pages.length) return;
    _pageIndex = index;
    pageController.jumpToPage(index);
    update();
  }
}
