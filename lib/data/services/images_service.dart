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
  static Future<ImageProvider?> loadFromDisk(String? url, {required ImageQuality quality}) async {
    if (url == null) {
      Logger.warning('loadFromDisk: No URL provided.');
      return null;
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
        return NetworkImage(data['preview']);
      } on Exception catch (e) {
        Logger.exception(e, where: 'ImagesService.loadFromDisk');
        return null;
      }
    }
  }
}
