import 'package:flutter/foundation.dart';

abstract class Debug {
  static void log(Object object) {
    if (kDebugMode) {
      print(object.toString());
    }
  }
}
