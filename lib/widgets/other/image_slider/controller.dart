import 'package:get/get.dart';

class SliderController extends GetxController {
  SliderController({required this.length});

  final int length;

  int _index = 0;
  int get index => _index;

  void updateIndex(int value) {
    _index = value;
    update();
  }
}
