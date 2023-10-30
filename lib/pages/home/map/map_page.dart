import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage>
    with AutomaticKeepAliveClientMixin<MapPage> {
  final MapController controller = MapController.withPosition(
    initPosition: GeoPoint(latitude: 56.835180, longitude: 60.613433),
  );

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Center(
        child: OSMFlutter(
          mapIsLoading: const Center(child: CircularProgressIndicator()),
          controller: controller,
          osmOption: const OSMOption(
            showContributorBadgeForOSM: true,
            zoomOption: ZoomOption(
              initZoom: 13,
              maxZoomLevel: 19,
              minZoomLevel: 10,
            ),
          ),
        ),
      ),
    );
  }
}
