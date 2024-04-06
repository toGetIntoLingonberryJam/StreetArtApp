import 'package:get/get.dart';

extension GetToExtension<T extends GetxController> on T {
  T get to => Get.find<T>();
}
