import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/models/author/author.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/widgets/other/app_loading_indicator.dart';
import 'package:street_art_witnesses/widgets/skeletons/app_placeholder.dart';

class AuthorsView extends StatelessWidget {
  const AuthorsView({
    super.key,
    required this.authors,
  });

  final List<Author>? authors;

  Future<void> _refresh(BuildContext context) async {
    return await context.read<UserProvider>().syncUserData();
  }

  @override
  Widget build(BuildContext context) {
    if (authors == null) {
      return const Center(child: AppLoadingIndicator());
    }
    if (authors!.isEmpty) {
      return const Center(
          child: Text(
        'У вас нет сохраненных авторов',
        style: TextStyles.headline2,
      ));
    }

    return RefreshIndicator(
      onRefresh: () => _refresh(context),
      child: ListView.separated(
        itemCount: authors!.length,
        itemBuilder: (_, index) => AuthorCard(author: authors![index]),
        separatorBuilder: (_, __) => const SizedBox(height: 8),
      ),
    );
  }
}

class AuthorCard extends StatelessWidget {
  const AuthorCard({
    super.key,
    required this.author,
  });

  final Author author;

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
