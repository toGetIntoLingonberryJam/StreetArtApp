import 'dart:math';

import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';
import 'package:street_art_witnesses/widgets/containers/grid_column.dart';

abstract class Loaders {
  static const Widget defaultLoader = Scaffold(body: Center(child: AppLoadingIndicator()));
  static const Widget artwork = _ArtworkLoader();
  static const Widget artist = _ArtistLoader();
  static const Widget festival = _ArtistLoader();
  static Widget collection(int length) => _CollectionLoader(length);
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

class _ArtworkLoader extends StatelessWidget {
  const _ArtworkLoader();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: ''),
      body: ListView(
        padding: kDensePagePadding,
        children: const [
          Skeleton(height: 400),
          SizedBox(height: Paddings.small),
          Skeleton(height: 96),
          SizedBox(height: Paddings.small),
          Skeleton(height: 50),
          SizedBox(height: Paddings.small),
          Skeleton(height: 70),
          SizedBox(height: Paddings.small),
          Skeleton(height: 300),
        ],
      ),
    );
  }
}

class _ArtistLoader extends StatelessWidget {
  const _ArtistLoader();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppHeader(title: ''),
      body: ListView(
        padding: kDensePagePadding,
        children: const [
          Skeleton(height: 400),
          SizedBox(height: Paddings.small),
          Skeleton(height: 46),
        ],
      ),
    );
  }
}

class _CollectionLoader extends StatelessWidget {
  const _CollectionLoader(this.length);

  final int length;

  @override
  Widget build(BuildContext context) {
    if (length == 0) return const Center(child: AppLoadingIndicator());

    return GridColumn(
      isScrollable: true,
      itemCount: min(length, 6),
      itemBuilder: (context, index) => const Skeleton(),
      crossAxisCount: 1,
      childAspectRatio: 2.23,
    );
  }
}
