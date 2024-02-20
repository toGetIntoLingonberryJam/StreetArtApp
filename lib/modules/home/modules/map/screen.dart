import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/data/blocs/map/map_cubit.dart';
import 'package:street_art_witnesses/data/models/map/map_task.dart';
import 'package:street_art_witnesses/modules/home/modules/map/controller.dart';
import 'package:street_art_witnesses/modules/home/modules/map/controllers_layer.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';

class MapScreen extends GetView<GetMapController> {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FlutterMap(
            mapController: controller.mapController.mapController,
            options: MapOptions(
              keepAlive: true,
              initialZoom: 12,
              backgroundColor: Theme.of(context).colorScheme.background,
              initialCenter: const LatLng(56.8519, 60.6122),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                tileProvider: CancellableNetworkTileProvider(),
              ),
              if (controller.isNavigator)
                PolylineLayer(
                  polylines: [
                    Polyline(strokeWidth: 5, color: Colors.red, points: controller.points),
                  ],
                ),
              BlocBuilder<MapCubit, MapState>(
                builder: (context, state) {
                  return MarkerLayer(markers: context.read<MapCubit>().markers);
                },
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
              const MapControllersLayer(),
            ],
          ),
        ),
        BlocBuilder<MapCubit, MapState>(
          builder: (context, state) {
            if (state is MapNavigator) {
              return AppButton.primary(
                onTap: () =>
                    context.read<MapCubit>().addTask(MapMessageTask('Следование отменено')),
                label: 'Отменить следование',
              );
            }
            return const SizedBox();
          },
        ),
      ],
    );
  }
}
