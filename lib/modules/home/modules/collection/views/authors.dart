import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/models/author/author.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class AuthorsView extends StatelessWidget {
  const AuthorsView({
    super.key,
    required this.artists,
  });

  final List<Artist>? artists;

  @override
  Widget build(BuildContext context) {
    if (artists == null) {
      return const Center(child: AppLoadingIndicator());
    }
    if (artists!.isEmpty) {
      return const Center(
          child: Text(
        'У вас нет сохраненных авторов',
        style: TextStyles.headline2,
      ));
    }

    return ListView.separated(
      itemCount: artists!.length,
      itemBuilder: (_, index) => AuthorCard(author: artists![index]),
      separatorBuilder: (_, __) => const SizedBox(height: 8),
    );
  }
}

class AuthorCard extends StatelessWidget {
  const AuthorCard({
    super.key,
    required this.author,
  });

  final Artist author;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AppPlaceholder.assetImage(),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 100,
              alignment: Alignment.centerLeft,
              child: Text(
                author.name,
                style: TextStyles.headline1,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(5),
            child: Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }
}
