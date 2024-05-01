import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/widgets/other/app_header.dart';

class NotAuthorizedCollectionScreen extends StatelessWidget {
  const NotAuthorizedCollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppHeader(
        title: 'Избранное',
        autoImplyLeading: false,
        // action: GestureDetector(onTap: () {}, child: const Icon(Icons.search)),
      ),
      body: Padding(
        padding: kPagePadding,
        child: Center(
          child: Text(
            'Войдите в аккаунт, чтобы сохранять\nработы в избранное',
            style: TextStyles.headline2,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
