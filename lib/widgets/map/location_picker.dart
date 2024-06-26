import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cache/flutter_map_cache.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/core/extensions.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/data/api/local_store_datasource.dart';
import 'package:street_art_witnesses/modules/home/modules/map/controller.dart';
import 'package:street_art_witnesses/modules/home/modules/map/layers/controllers/layer.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class LocationPicker extends StatelessWidget {
  const LocationPicker({super.key, required this.initLocation, this.onLocationPicked});

  final LatLng initLocation;
  final void Function(LatLng location)? onLocationPicked;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(GetMapController(), tag: 'location_picker');
    return Scaffold(
      appBar: const AppHeader(title: 'Координаты работы'),
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kContainerRadius),
                  child: FlutterMap(
                    mapController: c.mapController.mapController,
                    options: MapOptions(
                      initialZoom: 12,
                      backgroundColor: UIColors.background,
                      initialCenter: initLocation,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        tileProvider: CachedTileProvider(
                          maxStale: const Duration(days: 30),
                          store: HiveCacheStore(LocalStoreDataSource.instance.cacheDirectoryPath, hiveBoxName: 'HiveCacheStore'),
                        ),
                      ),
                      const MarkerLayer(
                        markers: [],
                        // markers: context.read<MapCubit>().markers,
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
                      const MapControllersLayer(geopostion: false, mapTag: 'location_picker'),
                      const _PickerMarker(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: kPagePadding,
                          child: AppButton.primary(
                            onTap: () {
                              onLocationPicked?.call(c.mapCenter);
                              closeScreen();
                            },
                            label: 'Выбрать',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PickerMarker extends StatelessWidget {
  const _PickerMarker();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 80,
        child: Align(
          alignment: Alignment.topCenter,
          child: Icon(Icons.location_on, color: Colors.red, size: 50),
        ),
      ),
    );
  }
}
