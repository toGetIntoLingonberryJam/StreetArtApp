import 'package:flutter/material.dart';
import 'package:street_art_witnesses/pages/artwork/artwork_page.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/src/services/artwork_service.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';
import 'package:street_art_witnesses/src/widgets/app_circle_avatar.dart';

class LocationMarker extends StatelessWidget {
  const LocationMarker({super.key, required this.location});

  final ArtworkLocation location;

  void _onTap(BuildContext context, ArtworkLocation location) async {
    final future = ArtworkService.artwork(location.artworkId);
    final artwork = await Utils.showLoading(context, future);

    if (artwork == null) {
      Utils.showSnackBar('Не удалось получить данные о работе');
    } else if (context.mounted) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ArtworkPage(artwork: artwork),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context, location),
      child: AppCircleAvatar(
        image: location.previewUrl == null
            ? null
            : NetworkImage(location.previewUrl!),
      ),
    );
  }
}
