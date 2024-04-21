import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/core/utils/logger.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/data/services/location_service.dart';
import 'package:street_art_witnesses/modules/home/modules/map/controller.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

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
    Logger.d(start);
    if (!context.mounted) return;

    Get.find<GetMapController>().navigator.setRouteToArtwork(artwork.id);
    Get.back();
  }

  void _showPreviewWarning(BuildContext context) {
    Utils.showInfo('Эта функция недоступна в режиме предпросмотра');
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
                Text('Адрес:', style: TextStyles.text.copyWith(color: UIColors.textSecondary)),
                const SizedBox(height: Paddings.small),
                Text(artwork.location.address, style: TextStyles.headline2),
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
