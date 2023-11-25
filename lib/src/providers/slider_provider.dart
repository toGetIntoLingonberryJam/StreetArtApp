import 'package:flutter/material.dart';

class SliderProvider with ChangeNotifier {
  SliderProvider({required this.length});

  final int length;

  int _index = 0;
  int get index => _index;

  void updateIndex(int value) {
    _index = value;
    notifyListeners();
  }
}
