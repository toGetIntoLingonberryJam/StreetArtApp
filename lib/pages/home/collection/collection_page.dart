import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/pages/home/collection/artworks_view.dart';
import 'package:street_art_witnesses/pages/home/collection/authors_view.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
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
    final user = context.watch<UserProvider>();

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
                    ? AuthorsView(authors: user.likedAuthors)
                    : ArtworksView(artworks: user.likedArtworks),
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
              ? AppButton.primary(onTap: _switchToArtworks, text: 'Работы')
              : AppButton.secondary(onTap: _switchToArtworks, text: 'Работы'),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: page == _Page.authors
              ? AppButton.primary(onTap: _switchToAuthors, text: 'Авторы')
              : AppButton.secondary(onTap: _switchToAuthors, text: 'Авторы'),
        ),
      ],
    );
  }
}
