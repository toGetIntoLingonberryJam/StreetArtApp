import 'package:flutter/material.dart';
import 'package:street_art_witnesses/data/api/ya_disk_api.dart';
import 'package:street_art_witnesses/data/services/settings_service.dart';
import 'package:street_art_witnesses/core/utils/logger.dart';

// enum ImageQuality { xxxs, xxs, xs, s, m, l, xl, xxl, xxxl, c }
const _mapQualityToSize = {
  ImageQuality.preview: 'S',
  ImageQuality.bad: 'L',
  ImageQuality.good: 'XL',
  ImageQuality.best: 'XXXL',
};

abstract class ImagesService {
  static final Map<ImageQuality, Map<String, ImageProvider>> _mapUrlToImage = {
    ImageQuality.preview: {},
    ImageQuality.bad: {},
    ImageQuality.good: {},
    ImageQuality.best: {},
  };
  static int loads = 0;

  static Future<ImageProvider?> loadFromDisk(String url, {required ImageQuality quality}) async {
    loads += 1;
    if (loads % 10 == 0) Logger.m('LoadFromDisk: $url, count: $loads');
    if (_mapUrlToImage[quality]!.containsKey(url)) {
      return _mapUrlToImage[quality]![url];
    }

    final response = await YaDiskApi.get(
      '/v1/disk/public/resources/',
      queryParameters: {
        'public_key': url,
        'preview_size': _mapQualityToSize[quality],
        'fields': 'preview',
      },
    );
    if (response == null) {
      return null;
    } else {
      try {
        final String imageUrl = response.data!['preview'];
        _mapUrlToImage[quality]![url] = NetworkImage(imageUrl);
        return _mapUrlToImage[quality]![url];
      } on Exception catch (e) {
        Logger.exception(e, where: 'ImagesService.loadFromDisk');
        return null;
      }
    }
  }
}
