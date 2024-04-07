import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:get/get.dart' hide FormData;
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork.dart';
import 'package:street_art_witnesses/data/models/artwork/artwork_location/artwork_location.dart';
import 'package:street_art_witnesses/data/services/auth_service.dart';
import 'package:street_art_witnesses/modules/moderation/screens/thanks.dart';

class ModerationData {
  String? title;
  ArtistPreview? artist;
  String? address;
  LatLng? location;
  String? year;
  String? description;
  String? link;
}

class ModerationController extends GetxController {
  final _data = ModerationData();
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void sendToModeration() async {
    final token = Get.find<AuthService>().user.value.token!;
    final formData = FormData.fromMap({
      'artwork_ticket_schema': jsonEncode(_getTicketData(preview)),
    });

    final future = BackendApi.post(
      '/v1/tickets/artwork',
      data: formData,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
        contentType: Headers.multipartFormDataContentType,
      ),
    );
    final result = await Utils.showLoading(future);
    result == null
        ? Get.to(() => const SAErrorScreen())
        : Get.off(() => const ModerationThanksScreen());
  }

  void saveMainInfo({
    required String title,
    required String address,
    required LatLng location,
    required ArtistPreview artist,
  }) {
    _data.title = title;
    _data.artist = artist;
    _data.address = address;
    _data.location = location;
  }

  void saveAdditionalInfo(
      {required String? year, required String? description, required String? link}) {
    _data.year = year;
    _data.description = description;
    _data.link = link;
  }

  Artwork get preview => Artwork(
        title: _data.title ?? 'Название работы',
        yearCreated: int.tryParse(_data.year ?? ''),
        description: _data.description,
        sourceDescription: '',
        artistId: null,
        festivalId: null,
        statusCode: ArtworkStatus.existing.name,
        id: -1,
        addedByUserId: -1,
        updatedAt: '-',
        location: ArtworkLocation(
          address: _data.address ?? 'Адрес работы',
          artworkId: -1,
          latitude: _data.location?.latitude ?? 0,
          longitude: _data.location?.longitude ?? 0,
          previewUrl: null,
        ),
        artistPreview: _data.artist,
        festivalPreview: null,
        links: _data.link == null ? null : [_data.link!],
        images: null,
      );
}

Map<String, dynamic> _getTicketData(Artwork artwork) {
  return {
    "ticket_type": "create",
    "artwork_data": {
      "title": artwork.title,
      "year_created": artwork.yearCreated,
      "description": artwork.description,
      "artist_id": artwork.artistId,
      "festival_id": null,
      "status": "existing",
      "links": artwork.links,
      "location": {
        "latitude": artwork.location.latitude,
        "longitude": artwork.location.longitude,
        "address": artwork.location.address,
      },
    }
  };
}
