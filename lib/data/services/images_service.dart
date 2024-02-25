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

final Map<String, ImageProvider> _mapUrlToImage = {};
int loads = 0;

abstract class ImagesService {
  static Future<ImageProvider?> loadFromDisk(String url, {required ImageQuality quality}) async {
    loads += 1;
    Logger.message('LoadFromDisk: $url, count: $loads');
    if (_mapUrlToImage.containsKey(url)) {
      return _mapUrlToImage[url];
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
        final Map<String, dynamic> data = response.data!;
        _mapUrlToImage[url] = NetworkImage(data['preview']);
        return _mapUrlToImage[url];
      } on Exception catch (e) {
        Logger.exception(e, where: 'ImagesService.loadFromDisk');
        return null;
      }
    }
  }
}
