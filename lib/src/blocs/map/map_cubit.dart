import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/src/models/map/map_task.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  List<Marker> _markers = [];
  List<Marker> get markers => _markers;

  void addTask(MapTask task) => emit(MapTaskState(task));

  void setMarkers(List<Marker> markers) {
    _markers = markers;
    emit(MapInitial());
  }

  void setRoute(List<LatLng> route) => emit(MapNavigator(route));
}
