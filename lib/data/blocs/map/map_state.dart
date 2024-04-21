part of 'map_cubit.dart';

@immutable
sealed class MapState {}

final class MapInitial extends MapState {}

final class MapTaskState extends MapState {
  MapTaskState(this.task);
  final MapTask task;
}

final class MapNavigator extends MapState {
  MapNavigator(this.route);
  final List<LatLng> route;
}

final class MapError extends MapState {
  MapError(this.error);
  final String error;
}
