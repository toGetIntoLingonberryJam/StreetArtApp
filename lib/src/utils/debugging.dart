import 'package:flutter/foundation.dart';

abstract class Debug {
  static void log(Object object) {
    if (kDebugMode) {
      switch (object.runtimeType) {
        case Error:
          print('\x1B[31m[ERROR]: ${(object as Error).toString()}\x1B[0m');
        default:
          print('\x1B[33m${object.toString()}\x1B[0m');
      }
    }
  }
}
