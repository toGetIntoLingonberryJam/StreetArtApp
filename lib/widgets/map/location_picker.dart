import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/modules/home/modules/map/controller.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/modules/home/modules/map/layers/controllers/layer.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class LocationPicker extends StatelessWidget {
  const LocationPicker({super.key, required this.initLocation});

  final LatLng initLocation;

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
                      TileLayer(urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
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
                      const MapControllersLayer(
                        geopostion: false,
                        search: false,
                        mapTag: 'location_picker',
                      ),
                      const _PickerMarker(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: kPagePadding,
                          child: AppButton.primary(
                              onTap: () => Get.back(result: c.mapCenter), label: 'Выбрать'),
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
