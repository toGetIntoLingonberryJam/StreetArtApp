import 'package:flutter/foundation.dart';

abstract class Debug {
  static void log(String message) {
    if (kDebugMode) {
      print(message);
    }
  }
}
