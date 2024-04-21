import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/utils/logger.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/data/services/location_service.dart';

class UserLocationController extends GetxController {
  Position? lastPosition;

  bool _isFetching = false;
  bool get isFetching => _isFetching;
  set isFetching(bool value) {
    _isFetching = value;
    update();
  }

  Future<Position?> fetchUserPosition(BuildContext context) async {
    if (_isFetching) {
      return null;
    }
    try {
      isFetching = true;
      final position = await LocationService.getCurrentPosition();
      lastPosition = position;
      isFetching = false;
      Logger.d('Position: $position');
      return position;
    } catch (e) {
      isFetching = false;
      Logger.w(e.toString());
      if (context.mounted) {
        Utils.showError(e.toString());
      }
      return null;
    }
  }
}
