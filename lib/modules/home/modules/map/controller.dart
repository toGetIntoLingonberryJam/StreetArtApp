import 'package:flutter/material.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class GetMapController extends GetxController with GetTickerProviderStateMixin {
  late final mapController = AnimatedMapController(
    vsync: this,
    duration: const Duration(milliseconds: 350),
    curve: Curves.easeInOut,
  );
  final searchController = TextEditingController();
  final points = [
    const LatLng(56.8395722, 60.6077429),
    const LatLng(56.8519, 60.6122),
    const LatLng(56.86, 60.616),
    const LatLng(56.8537, 60.6222),
    const LatLng(56.8509, 60.639),
  ];

  LatLng get mapCenter => mapController.mapController.camera.center;
  bool get isNavigator => false;

  @override
  void dispose() {
    mapController.dispose();
    searchController.dispose();
    super.dispose();
  }
}
