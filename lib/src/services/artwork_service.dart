import 'package:flutter/material.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/src/models/author/author.dart';
import 'package:street_art_witnesses/src/data/backend_datasource.dart';
import 'package:street_art_witnesses/src/utils/logger.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

abstract class ArtworkService {
  static Future<List<Author>> getAuthors() async {
    await Future.delayed(const Duration(seconds: 2));
    return mockAuthors;
  }

  static Future<List<Artwork>> getArtworks() async {
    await Future.delayed(const Duration(seconds: 2));
    return mockArtworks;
  }

  static Future<Artwork?> getArtworkById(int id) async {
    final response = await BackendDataSource.get(
      '/v1/artworks/$id',
      requestType: RequestType.getArtworkById,
    );

    if (response == null) {
      return null;
    } else {
      final Map<String, dynamic> data = response.data!;
      return Artwork.fromJson(data);
    }
  }

  static Future<List<ArtworkLocation>> getLocations(BuildContext context) async {
    final response = await BackendDataSource.get(
      '/v1/artworks/locations',
      requestType: RequestType.getArtworkLocations,
    );

    if (response == null) {
      if (context.mounted) Utils.of(context).showError('Не удалось загрузить работы');
      return [];
    } else {
      final List<ArtworkLocation> locations = [];
      final List<dynamic> dataList = response.data;

      for (final locationData in dataList) {
        locations.add(ArtworkLocation.fromJson(locationData));
      }

      return locations;
    }
  }
}

const mockAuthors = [
  Author(
    name: 'Покрас Лампас',
    thumbnailUrl: null,
  ),
  Author(
    name: 'Roma Bantik',
    thumbnailUrl: null,
  ),
  Author(
    name: 'Philippenzo',
    thumbnailUrl: null,
  ),
];

const mockArtworks = <Artwork>[];
