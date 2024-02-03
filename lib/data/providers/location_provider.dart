import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:street_art_witnesses/data/services/location_service.dart';
import 'package:street_art_witnesses/core/utils/logger.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';

class LocationProvider extends ChangeNotifier {
  Position? lastPosition;

  bool _isFetching = false;
  bool get isFetching => _isFetching;
  set isFetching(bool value) {
    _isFetching = value;
    notifyListeners();
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
      Logger.message('Position: $position');
      return position;
    } catch (e) {
      isFetching = false;
      Logger.warning(e.toString());
      if (context.mounted) {
        Utils.of(context).showError(e.toString());
      }
      return null;
    }
  }
}
