import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/pages/home/map/location_marker.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/src/models/map/map_task.dart';
import 'package:street_art_witnesses/src/services/artwork_service.dart';
import 'package:street_art_witnesses/src/services/location_service.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  void addTask(MapTask task) => emit(MapTaskState(task));

  void setRoute(List<LatLng> route) => emit(MapNavigator(route));

  void update() => emit(MapInitial());

  List<Marker> _markers = [];
  List<Marker> get markers {
    final userLoc = LocationService.lastPosition;
    if (userLoc == null) return List.unmodifiable(_markers);
    final userMarker = Marker(
      height: 66,
      point: LatLng(userLoc.latitude, userLoc.longitude),
      child: Container(
        alignment: Alignment.topCenter,
        child: const Icon(Icons.location_on, color: Colors.red, size: 36),
      ),
    );
    return List.unmodifiable(_markers + [userMarker]);
  }

  void loadMarkers() async {
    final locations = await ArtworkService.getLocations();
    if (locations != null) {
      _setMarkers(_parseMarkers(locations));
    } else {
      emit(MapError('Не удалось загрузить работы'));
    }
  }

  void _setMarkers(List<Marker> markers) {
    _markers = markers;
    emit(MapInitial());
  }

  List<Marker> _parseMarkers(List<ArtworkLocation> locations) {
    return locations
        .where((element) => element.latitude >= -90 && element.latitude <= 90)
        .map((location) => Marker(
            point: LatLng(location.latitude, location.longitude),
            child: LocationMarker(location: location)))
        .toList();
  }
}
