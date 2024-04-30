import 'package:flutter/foundation.dart';

abstract class AppConfig {
  static bool get showApiOutput => kDebugMode && true;
}
