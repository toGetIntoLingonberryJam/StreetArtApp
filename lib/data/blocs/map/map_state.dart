part of 'map_cubit.dart';

@immutable
sealed class MapState {}

final class MapInitial extends MapState {}

final class MapTaskState extends MapState {
  MapTaskState(this.task);
  final MapTask task;
}

final class MapNavigator extends MapState {
  final List<LatLng> route;
  MapNavigator(this.route);
}

final class MapError extends MapState {
  final String error;
  MapError(this.error);
}
