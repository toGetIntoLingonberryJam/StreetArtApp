import 'package:flutter/material.dart';
import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/data/services/location_service.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/modules/home/modules/map/controller.dart';

class AddressInfo extends StatelessWidget {
  const AddressInfo({
    super.key,
    required this.artwork,
    required this.preview,
  });

  final Artwork artwork;
  final bool preview;

  void _buildRoute(BuildContext context) async {
    final userPosition = await Utils.showLoading(LocationService.getCurrentPosition());
    if (!context.mounted) return;
    if (userPosition == null) {
      return Utils.showError('Не удалось получить вашу геолокацию');
    }

    final start = LatLng(userPosition.latitude, userPosition.longitude);
    if (!context.mounted) return;

    Get.find<GetMapController>().navigator.setRouteToArtwork(artwork.id);
    Get.back();
  }

  void _showPreviewWarning(BuildContext context) {
    Utils.showInfo('Эта функция недоступна в режиме предпросмотра');
  }

  @override
  Widget build(BuildContext context) {
    return SAContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Адрес:', style: SATextStyles.headline2),
                const SizedBox(height: 10),
                Text(artwork.location.address, style: SATextStyles.textAdditional),
              ],
            ),
          ),
          // TODO: Fix routing
          // AppCustomButton.filled(
          //   onTap: preview ? () => _showPreviewWarning(context) : () => _buildRoute(context),
          //   child: const Row(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Text('маршрут', style: TextStyle(color: Colors.black)),
          //       SizedBox(width: 8),
          //       Icon(Icons.near_me_outlined, size: 16, color: Colors.black),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
