import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/views/artists.dart';
import 'package:street_art_witnesses/modules/search/controller.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AppSearchController());
    return Scaffold(
      appBar: const AppHeader(title: 'Поиск'),
      body: GetBuilder<AppSearchController>(builder: (c) {
        final items = c.items;

        return Padding(
          padding: kPagePadding,
          child: Column(
            children: [
              AppTextFormField(
                hintText: '',
                validator: null,
                controller: c.searchController,
              ),
              Expanded(
                child: c.isLoading
                    ? const _ArtistsLoader()
                    : ListView.separated(
                        itemCount: items.length,
                        itemBuilder: (_, i) => GestureDetector(
                          onTap: () => Get.back(result: items[i]),
                          child: ArtistCard(artist: items[i]),
                        ),
                        separatorBuilder: (_, __) => const SizedBox(height: Paddings.normal),
                      ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _ArtistsLoader extends StatelessWidget {
  const _ArtistsLoader();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (_, i) => const AppContainer(child: SizedBox(height: 100)),
      separatorBuilder: (_, __) => const SizedBox(height: 20),
    );
  }
}
