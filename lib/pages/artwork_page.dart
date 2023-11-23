import 'package:flutter/material.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork.dart';

class ArtworkPage extends StatelessWidget {
  const ArtworkPage({super.key, required this.artwork});

  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Работа', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
