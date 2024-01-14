import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/pages/home/map/location_marker.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/src/models/map/map_task.dart';
import 'package:street_art_witnesses/src/services/artwork_service.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  List<Marker> _markers = [];
  List<Marker> get markers => List.unmodifiable(_markers);

  void addTask(MapTask task) => emit(MapTaskState(task));

  void setRoute(List<LatLng> route) => emit(MapNavigator(route));

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
