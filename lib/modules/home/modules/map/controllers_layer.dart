import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/data/blocs/map/map_cubit.dart';
import 'package:street_art_witnesses/data/providers/location_provider.dart';
import 'package:street_art_witnesses/modules/home/modules/map/controller.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class MapControllersLayer extends GetView<GetMapController> {
  const MapControllersLayer({
    super.key,
    this.search = true,
    this.zoom = true,
    this.geopostion = true,
  });

  final bool search;
  final bool zoom;
  final bool geopostion;

  void _fetchUserPosition(BuildContext context) async {
    final position = await context.read<LocationProvider>().fetchUserPosition(context);
    if (position != null && context.mounted) {
      MapController.of(context).move(
        LatLng(position.latitude, position.longitude),
        12,
      );
      context.read<MapCubit>().update();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (search)
                AppTextFormField(
                  controller: controller.searchController,
                  prefixIcon: const Icon(Icons.search, size: 16),
                  hintText: 'Поиск',
                  validator: null,
                ),
              const Expanded(flex: 5, child: SizedBox()),
              if (zoom)
                FloatingActionButton(
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                  heroTag: 'zoom_in',
                  onPressed: () => controller.mapController.animatedZoomIn(),
                  child: Icon(
                    Icons.add,
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
              const SizedBox(height: 10),
              if (zoom)
                FloatingActionButton(
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                  heroTag: 'zoom_out',
                  onPressed: () => controller.mapController.animatedZoomOut(),
                  child: Icon(
                    Icons.remove,
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
              const Expanded(flex: 3, child: SizedBox()),
              if (geopostion)
                Consumer<LocationProvider>(
                  builder: (context, provider, child) {
                    return FloatingActionButton(
                      backgroundColor: Theme.of(context).colorScheme.onBackground,
                      heroTag: 'fetch_location',
                      onPressed: () => _fetchUserPosition(context),
                      child: provider.isFetching
                          ? SizedBox(
                              width: 24,
                              height: 24,
                              child: AppLoadingIndicator(
                                color: Theme.of(context).colorScheme.inverseSurface,
                              ),
                            )
                          : Icon(
                              Icons.near_me_outlined,
                              color: Theme.of(context).colorScheme.inverseSurface,
                            ),
                    );
                  },
                ),
              const Expanded(flex: 1, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
