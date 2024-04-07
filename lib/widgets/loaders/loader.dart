import 'package:street_art_ui_kit/street_art_ui_kit.dart';

import 'artist_loader.dart';
import 'artwork_loader.dart';

abstract class Loaders {
  static const Widget defaultLoader = Scaffold(body: Center(child: SALoadingIndicator()));
  static const Widget artwork = ArtworkLoader();
  static const Widget artist = ArtistLoader();
}

class Loader<T> extends StatelessWidget {
  const Loader({
    super.key,
    required this.future,
    required this.builder,
    this.loader = Loaders.defaultLoader,
    this.onError,
  });

  final Future<T> future;
  final Widget Function(T data) builder;
  final Widget loader;
  final void Function()? onError;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
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
