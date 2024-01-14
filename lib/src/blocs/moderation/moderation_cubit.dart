import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_location.dart';

part 'moderation_state.dart';

class ModerationData {
  String? title;
  String? address;
  String? year;
  String? description;
}

class ModerationCubit extends Cubit<ModerationState> {
  ModerationCubit({required ModerationState state}) : super(state);

  final _data = ModerationData();

  void showEdit() => emit(ModerationEdit());
  void showThanks() => emit(ModerationThanks());

  void saveMainInfo({required String title, required String address}) {
    _data.title = title;
    _data.address = address;
  }

  void saveAdditionalInfo({required String year, required String description}) {
    _data.year = year;
    _data.description = description;
  }

  Artwork get preview => Artwork(
        title: _data.title ?? 'Название работы',
        yearCreated: int.tryParse(_data.year ?? '') ?? 0,
        description: _data.description ?? 'Описание работы',
        sourceDescription: '',
        artistId: null,
        festivalId: null,
        status: ArtworkStatus.unknown,
        id: -1,
        addedByUserId: -1,
        updatedAt: '-',
        location: ArtworkLocation(
          address: _data.address ?? 'Адрес работы',
          artworkId: -1,
          latitude: 0,
          longitude: 0,
          previewUrl: null,
        ),
        links: null,
        images: null,
      );
}
