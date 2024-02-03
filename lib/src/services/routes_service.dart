import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/src/data/backend_api.dart';

abstract class RoutesService {
  static Future<List<LatLng>> getRoute(LatLng start, int artworkId) async {
    final response = await BackendApi.get(
      '/v1/geo/route',
      queryParameters: {
        'user_coords': '${start.latitude},${start.longitude}',
        'artwork_ids': artworkId,
      },
    );

    if (response == null) {
      return [];
    } else {
      final Map<String, dynamic> data = response.data!;
      final points = data['route'];
      List<LatLng> route = [];
      for (final point in points) {
        route.add(LatLng(point[0], point[1]));
      }
      return route;
    }
  }

  static Future<List<LatLng>> getMockRoute() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      const LatLng(56.8395722, 60.6077429),
      const LatLng(56.8519, 60.6122),
      const LatLng(56.86, 60.616),
      const LatLng(56.8537, 60.6222),
      const LatLng(56.8509, 60.639),
    ];
  }
}
