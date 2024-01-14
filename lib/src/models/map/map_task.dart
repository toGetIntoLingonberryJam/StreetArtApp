import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/src/blocs/map/map_cubit.dart';
import 'package:street_art_witnesses/src/services/routes_service.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

abstract class MapTask {
  void complete(BuildContext context);
}

final class MapTestTask extends MapTask {
  @override
  void complete(BuildContext context) => Utils.of(context).showMessage('Test MapTask');
}

final class MapRouteTask extends MapTask {
  MapRouteTask(this.start, this.artworkId);

  final LatLng start;
  final int artworkId;

  @override
  void complete(BuildContext context) async {
    // const start = LatLng(56.8509, 60.639);

    final route = await Utils.of(context).showLoading(RoutesService.getRoute(start, artworkId));
    if (context.mounted && route != null) context.read<MapCubit>().setRoute(route);
  }
}
