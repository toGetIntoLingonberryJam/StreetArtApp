import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/modules/home/map/controllers_layer.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/widgets/other/app_appbar.dart';

class LocationPicker extends StatefulWidget {
  const LocationPicker({super.key});

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> with TickerProviderStateMixin {
  late final controller = AnimatedMapController(vsync: this);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: Column(
            children: [
              const AppAppbar(title: 'Координаты работы'),
              const SizedBox(height: 20),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kContainerRadius),
                  child: FlutterMap(
                    mapController: controller.mapController,
                    options: MapOptions(
                      initialZoom: 12,
                      backgroundColor: Theme.of(context).colorScheme.background,
                      initialCenter: const LatLng(56.8519, 60.6122),
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
                            onTap: () => Utils.of(context).tryLaunchUrl(
                              Uri.parse('https://openstreetmap.org/copyright'),
                            ),
                          ),
                        ],
                      ),
                      ControllersLayer(controller: controller, geopostion: false, search: false),
                      const _PickerMarker(),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: kPagePadding,
                          child: AppButton.primary(
                              onTap: () => Get.back(result: controller.mapController.camera.center),
                              label: 'Выбрать'),
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
