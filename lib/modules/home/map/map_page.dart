import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/modules/home/map/controllers_layer.dart';
import 'package:street_art_witnesses/src/blocs/map/map_cubit.dart';
import 'package:street_art_witnesses/src/models/map/map_task.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> with TickerProviderStateMixin {
  late final controller = AnimatedMapController(
    vsync: this,
    duration: const Duration(milliseconds: 350),
    curve: Curves.easeInOut,
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MapCubit, MapState>(
      listener: (context, state) {
        if (state is MapTaskState) state.task.complete(context);
      },
      child: _MapView(controller),
    );
  }
}

class _MapView extends StatelessWidget {
  const _MapView(this.controller);

  final AnimatedMapController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FlutterMap(
            mapController: controller.mapController,
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
              BlocBuilder<MapCubit, MapState>(
                builder: (context, state) {
                  if (state is MapNavigator) {
                    return PolylineLayer(
                      polylines: [
                        Polyline(
                          strokeWidth: 5,
                          color: Colors.red,
                          points: state.route,
                        ),
                      ],
                    );
                  }
                  return const SizedBox();
                },
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
              ControllersLayer(controller: controller),
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
