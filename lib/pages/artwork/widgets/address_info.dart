import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork.dart';
import 'package:street_art_witnesses/src/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/src/widgets/buttons/app_custom_button.dart';

class AddressInfo extends StatelessWidget {
  const AddressInfo({
    super.key,
    required this.artwork,
  });

  final Artwork artwork;

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
                Text('Адрес:', style: TextStyles.headlines.w500),
                const SizedBox(height: 10),
                Text(artwork.location.address, style: TextStyles.labels.w500),
                const SizedBox(height: 10),
                Text('N метров от вас', style: TextStyles.captions.w400),
              ],
            ),
          ),
          AppCustomButton.filled(
            onTap: () {},
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
