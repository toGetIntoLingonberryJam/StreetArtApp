import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/data/blocs/map/map_cubit.dart';
import 'package:street_art_witnesses/data/services/routes_service.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';

abstract class MapTask {
  void complete(BuildContext context);
}

final class MapMessageTask extends MapTask {
  final String message;
  MapMessageTask(this.message);

  @override
  void complete(BuildContext context) => Utils.of(context).showMessage(message);
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
