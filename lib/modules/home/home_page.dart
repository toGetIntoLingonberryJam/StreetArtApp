import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:street_art_witnesses/modules/home/collection/collection_page.dart';
import 'package:street_art_witnesses/modules/home/map/map_page.dart';
import 'package:street_art_witnesses/modules/user/screen.dart';
import 'package:street_art_witnesses/src/blocs/main_menu/main_menu_cubit.dart';
import 'package:street_art_witnesses/src/blocs/map/map_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final _pageController = PageController(
    initialPage: context.read<MainMenuCubit>().state.pageIndex,
  );

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainMenuCubit, MainMenuState>(
      listener: (context, state) {
        _pageController.jumpToPage(state.pageIndex);
        if (state is MainMenuMap) context.read<MapCubit>().loadMarkers();
      },
      child: Scaffold(
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: _pages,
        ),
        bottomNavigationBar: BlocBuilder<MainMenuCubit, MainMenuState>(
          builder: (context, state) {
            return BottomNavigationBar(
              backgroundColor: Theme.of(context).colorScheme.onBackground,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: true,
              selectedFontSize: 12,
              currentIndex: state.pageIndex,
              selectedItemColor: Theme.of(context).colorScheme.inverseSurface,
              onTap: (index) {
                context.read<MainMenuCubit>().showPage(index);
              },
              items: _navbarItems,
            );
          },
        ),
      ),
    );
  }
}

const _navbarItems = [
  BottomNavigationBarItem(
    label: 'Карта',
    icon: Icon(Icons.map_outlined),
  ),
  // BottomNavigationBarItem(
  //   label: 'Экскурсии',
  //   icon: Icon(Icons.directions_walk),
  // ),
  BottomNavigationBarItem(
    label: 'Коллекция',
    icon: Icon(Icons.favorite_outline),
  ),
  BottomNavigationBarItem(
    label: 'Профиль',
    icon: Badge(
      label: Text('1'),
      textColor: Colors.white,
      child: Icon(Icons.person_outline),
    ),
  ),
];

const _pages = [
  MapPage(),
  // ToursPage(),
  CollectionPage(),
  UserScreen(),
];
