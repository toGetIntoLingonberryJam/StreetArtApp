import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/data/services/auth_service.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/screen.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/views/not_authorized_collection_screen.dart';
import 'package:street_art_witnesses/modules/home/modules/map/screen.dart';
import 'package:street_art_witnesses/modules/user/screen.dart';

class HomeController extends GetxController {
  int _pageIndex = 0;
  int get pageIndex => _pageIndex;
  late final pageController = PageController(initialPage: _pageIndex);
  List<Widget> get pages => Get.find<AuthService>().user.value.isAuthorized ? authedPages : guestPages;

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

const authedPages = [MapScreen(), CollectionScreen(), ProfileScreen()];
const guestPages = [MapScreen(), NotAuthorizedCollectionScreen(), ProfileScreen()];
