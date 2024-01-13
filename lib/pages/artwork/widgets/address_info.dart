import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/blocs/map/map_cubit.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork.dart';
import 'package:street_art_witnesses/src/models/map/map_task.dart';
import 'package:street_art_witnesses/src/services/location_service.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/widgets/buttons/app_custom_button.dart';

class AddressInfo extends StatelessWidget {
  const AddressInfo({
    super.key,
    required this.artwork,
  });

  final Artwork artwork;

  void _buildRoute(BuildContext context) async {
    final userPosition = await Utils.of(context).showLoading(LocationService.getCurrentPosition());
    final start = LatLng(userPosition.latitude, userPosition.longitude);
    if (!context.mounted) return;

    context.read<MapCubit>().addTask(MapRouteTask(start, artwork.id));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Адрес:', style: TextStyles.headline2),
                const SizedBox(height: 10),
                Text(artwork.location.address, style: TextStyles.textAdditional),
                const SizedBox(height: 10),
                const Text('N метров от вас', style: TextStyles.caption),
              ],
            ),
          ),
          AppCustomButton.filled(
            onTap: () => _buildRoute(context),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('маршрут', style: TextStyle(color: Colors.black)),
                SizedBox(width: 8),
                Icon(Icons.near_me_outlined, size: 16, color: Colors.black),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
