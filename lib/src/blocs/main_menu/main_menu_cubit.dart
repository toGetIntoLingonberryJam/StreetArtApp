import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_menu_state.dart';

class MainMenuCubit extends Cubit<MainMenuState> {
  MainMenuCubit() : super(const MainMenuMap());

  void showMap() => emit(const MainMenuMap());
  void showCollection() => emit(const MainMenuCollection());
  void showProfile() => emit(const MainMenuProfile());

  void showPage(int pageIndex) {
    switch (pageIndex) {
      case 0:
        return showMap();
      case 1:
        return showCollection();
      case 2:
        return showProfile();
      default:
        return;
    }
  }
}
