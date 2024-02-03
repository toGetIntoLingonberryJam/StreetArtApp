part of 'main_menu_cubit.dart';

@immutable
sealed class MainMenuState {
  final int pageIndex;
  const MainMenuState(this.pageIndex);
}

final class MainMenuMap extends MainMenuState {
  const MainMenuMap() : super(0);
}

final class MainMenuCollection extends MainMenuState {
  const MainMenuCollection() : super(1);
}

final class MainMenuProfile extends MainMenuState {
  const MainMenuProfile() : super(2);
}
