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
    required this.preview,
  });

  final Artwork artwork;
  final bool preview;

  void _buildRoute(BuildContext context) async {
    final userPosition = await Utils.of(context).showLoading(LocationService.getCurrentPosition());
    if (!context.mounted) return;
    if (userPosition == null) {
      return Utils.of(context).showError('Не удалось получить вашу геолокацию');
    }

    final start = LatLng(userPosition.latitude, userPosition.longitude);
    if (!context.mounted) return;

    context.read<MapCubit>().addTask(MapRouteTask(start, artwork.id));
    Navigator.of(context).pop();
  }

  void _showPreviewWarning(BuildContext context) {
    Utils.of(context).showMessage('Эта функция недоступна в режиме предпросмотра');
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
              ],
            ),
          ),
          AppCustomButton.filled(
            onTap: preview ? () => _showPreviewWarning(context) : () => _buildRoute(context),
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
