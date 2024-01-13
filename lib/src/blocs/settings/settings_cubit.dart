import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:street_art_witnesses/src/services/local_store_service.dart';

part 'settings_state.dart';

enum ImageQuality { preview, bad, good, best }

enum ShowPages { moderationWarning }

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required ImageQuality initImageQuality})
      : _imageQuality = initImageQuality,
        super(SettingsInitial());

  // Image Quality
  ImageQuality _imageQuality;
  ImageQuality get imageQuality => _imageQuality;

  void setImageQuality(ImageQuality quality) async {
    await LocalStoreService.setImageQuality(quality);
    _imageQuality = quality;
    emit(SettingsInitial());
  }

  // Don't show again pages
  final Map<ShowPages, bool> _showPages = {
    ShowPages.moderationWarning: true,
  };

  bool isShowing(ShowPages page) => _showPages[page] ?? true;
  void dontShowAgain(ShowPages page) => _showPages[page] = false;
}
