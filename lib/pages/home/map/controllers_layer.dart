import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/src/providers/location_provider.dart';
import 'package:street_art_witnesses/widgets/other/app_loading_indicator.dart';
import 'package:street_art_witnesses/widgets/other/app_text_form_field.dart';

class ControllersLayer extends StatefulWidget {
  const ControllersLayer({super.key, required this.controller});

  final AnimatedMapController controller;

  @override
  State<ControllersLayer> createState() => _ControllersLayerState();
}

class _ControllersLayerState extends State<ControllersLayer> {
  final TextEditingController searchController = TextEditingController();

  void _fetchUserPosition(BuildContext context) async {
    final position = await context.read<LocationProvider>().fetchUserPosition(context);
    if (position != null && context.mounted) {
      MapController.of(context).move(
        LatLng(position.latitude, position.longitude),
        12,
      );
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
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
              AppTextFormField(
                controller: searchController,
                prefixIcon: const Icon(Icons.search, size: 16),
                hintText: 'Поиск',
                validator: null,
              ),
              const Expanded(flex: 5, child: SizedBox()),
              FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.onBackground,
                heroTag: 'zoom_in',
                onPressed: () => widget.controller.animatedZoomIn(),
                child: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
              const SizedBox(height: 10),
              FloatingActionButton(
                backgroundColor: Theme.of(context).colorScheme.onBackground,
                heroTag: 'zoom_out',
                onPressed: () => widget.controller.animatedZoomOut(),
                child: Icon(
                  Icons.remove,
                  color: Theme.of(context).colorScheme.inverseSurface,
                ),
              ),
              const Expanded(flex: 3, child: SizedBox()),
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
