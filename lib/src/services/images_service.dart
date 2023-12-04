import 'package:flutter/material.dart';
import 'package:street_art_witnesses/src/data/yandex_disk_datasource.dart';
import 'package:street_art_witnesses/src/utils/custom_logger.dart';

enum ImageQuality { xxxs, xxs, xs, s, m, l, xl, xxl, xxxl, c }

abstract class ImagesService {
  static Future<ImageProvider?> loadFromDisk(String? url,
      {required ImageQuality? quality}) async {
    if (url == null) {
      CustomLogger.showWarning('loadFromDisk: No URL provided.');
      return null;
    }

    final response = await YandexDiskDataSource.get(
      '/v1/disk/public/resources/',
      queryParameters: {
        'public_key': url,
        'preview_size': quality?.name.toUpperCase(),
        'fields': 'preview',
      },
      requestType: RequestType.loadImageFromDisk,
    );
    if (response == null) {
      return null;
    } else {
      try {
        final Map<String, dynamic> data = response.data!;
        return NetworkImage(data['preview']);
      } on Exception catch (e) {
        CustomLogger.showException(e,
            className: 'ImagesService', methodName: 'loadFromDisk');
        return null;
      }
    }
  }
}
