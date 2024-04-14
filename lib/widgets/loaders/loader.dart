import 'package:flutter/material.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

import 'artist_loader.dart';
import 'artwork_loader.dart';

abstract class Loaders {
  static const Widget defaultLoader = Scaffold(body: Center(child: AppLoadingIndicator()));
  static const Widget artwork = ArtworkLoader();
  static const Widget artist = ArtistLoader();
  static const Widget festival = ArtistLoader();
}

class Loader<T> extends StatelessWidget {
  const Loader({
    super.key,
    required this.future,
    required this.builder,
    this.loader = Loaders.defaultLoader,
    this.onError,
  });

  final Future<T?> future;
  final Widget Function(T data) builder;
  final Widget loader;
  final void Function()? onError;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          if (!snapshot.hasData) return const AppErrorScreen();
          return builder(snapshot.data as T);
        }
        if (snapshot.hasError) {
          onError?.call();
        }
        return loader;
      },
    );
  }
}
