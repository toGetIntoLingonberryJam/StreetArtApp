import 'dart:math';

import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cache/flutter_map_cache.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/data/api/local_store_datasource.dart';
import 'package:street_art_witnesses/modules/home/modules/map/cluster_marker.dart';
import 'package:street_art_witnesses/modules/home/modules/map/controller.dart';
import 'package:street_art_witnesses/modules/home/modules/map/layers/controllers/layer.dart';
import 'package:street_art_witnesses/modules/wide_screen/wide_home_controller.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class WideHomeScreen extends StatelessWidget {
  const WideHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WideHomeController());

    return Scaffold(
      body: GetBuilder<GetMapController>(builder: (c) {
        return Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: FlutterMap(
                    mapController: c.mapController.mapController,
                    options: const MapOptions(
                      keepAlive: true,
                      initialZoom: 12,
                      backgroundColor: UIColors.background,
                      initialCenter: LatLng(56.8519, 60.6122),
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        tileProvider: CachedTileProvider(
                          maxStale: const Duration(days: 30),
                          store: HiveCacheStore(LocalStoreDataSource.instance.cacheDirectoryPath, hiveBoxName: 'HiveCacheStore'),
                        ),
                      ),
                      if (c.navigator.show)
                        PolylineLayer(
                          polylines: [
                            Polyline(strokeWidth: 5, color: Colors.red, points: c.navigator.points),
                          ],
                        ),
                      MarkerClusterLayerWidget(
                        options: MarkerClusterLayerOptions(
                          markers: c.markers,
                          builder: (_, markers) => ClusterMarker(markersLength: markers.length),
                        ),
                      ),
                      RichAttributionWidget(
                        alignment: AttributionAlignment.bottomLeft,
                        attributions: [
                          TextSourceAttribution(
                            'OpenStreetMap contributors',
                            onTap: () => Utils.tryLaunchUrl(
                              Uri.parse('https://openstreetmap.org/copyright'),
                            ),
                          ),
                        ],
                      ),
                      const MapControllersLayer(),
                    ],
                  ),
                ),
                if (c.navigator.show)
                  AppButton.primary(
                    onTap: () => c.navigator.cancel(),
                    label: 'Отменить следование',
                  ),
              ],
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                final width = max(320.0, constraints.maxWidth / 4);
                return GetBuilder<WideHomeController>(
                  builder: (controller) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: width,
                        child: Scaffold(
                          body: Padding(
                            padding: const EdgeInsets.only(top: Paddings.normal),
                            child: controller.currentScreen,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        );
      }),
    );
  }
}
