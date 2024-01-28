import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/modules/home/collection/artworks_view.dart';
import 'package:street_art_witnesses/modules/home/collection/authors_view.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/widgets/other/app_appbar.dart';

enum _Page { artworks, authors }

class CollectionPage extends StatefulWidget {
  const CollectionPage({super.key});

  @override
  State<CollectionPage> createState() => _CollectionPageState();
}

class _CollectionPageState extends State<CollectionPage> {
  _Page page = _Page.artworks;

  void _switchToAuthors() => setState(() => page = _Page.authors);

  void _switchToArtworks() => setState(() => page = _Page.artworks);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPagePadding,
          child: Column(
            children: [
              AppAppbar(
                title: 'Ваша Коллекция',
                action: GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.search),
                ),
              ),
              const SizedBox(height: 20),
              _headerButtons(),
              const SizedBox(height: 20),
              Expanded(
                child: page == _Page.authors
                    ? const AuthorsView(authors: [])
                    : const ArtworksView(artworks: []),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _headerButtons() {
    return Row(
      children: [
        Expanded(
          child: page == _Page.artworks
              ? AppButton.primary(onTap: _switchToArtworks, label: 'Работы')
              : AppButton.secondary(onTap: _switchToArtworks, label: 'Работы'),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: page == _Page.authors
              ? AppButton.primary(onTap: _switchToAuthors, label: 'Авторы')
              : AppButton.secondary(onTap: _switchToAuthors, label: 'Авторы'),
        ),
      ],
    );
  }
}
