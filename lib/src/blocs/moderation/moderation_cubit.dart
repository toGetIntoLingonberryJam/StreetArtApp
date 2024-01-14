import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/src/data/backend_datasource.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/src/utils/logger.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

part 'moderation_state.dart';

class ModerationData {
  String? title;
  String? address;
  LatLng? location;
  String? year;
  String? description;
  String? link;
}

class ModerationCubit extends Cubit<ModerationState> {
  ModerationCubit({required ModerationState state}) : super(state);

  final _data = ModerationData();

  void showEdit() => emit(ModerationEdit());
  void sendToModeration(BuildContext context, {required String token}) async {
    final formData = FormData.fromMap({
      'artwork_ticket_schema': jsonEncode(_getTicketData(preview)),
    });

    final future = BackendDataSource.post(
      '/v1/tickets/artwork',
      requestType: RequestType.unknown,
      data: formData,
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
        contentType: Headers.multipartFormDataContentType,
      ),
    );
    final result = await Utils.of(context).showLoading(future);
    emit(result == null ? ModerationError() : ModerationThanks());
  }

  void saveMainInfo({required String title, required String address, required LatLng location}) {
    _data.title = title;
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
        status: ArtworkStatus.existing,
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
      "artist_id": null,
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
