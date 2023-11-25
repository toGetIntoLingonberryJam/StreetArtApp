import 'package:flutter/material.dart';

// Paddings
const kPagePadding = EdgeInsets.all(20);
const kDensePagePadding = EdgeInsets.symmetric(horizontal: 10, vertical: 20);
const kContainerPadding = EdgeInsets.symmetric(vertical: 10, horizontal: 12);

// Radiuses
final kFieldBorderRadius = BorderRadius.circular(10);
final kButtonBorderRadius = BorderRadius.circular(10);

const kContainerRadius = 18.0;
const kSmallContainerRadius = 10.0;

// TextStyles
abstract class TextStyles {
  static final body = TextStylesBody();
  static final titles = TextStyleTitles();
  static final headlines = TextStyleHeadlines();
  static final labels = TextStyleLabels();
  static final captions = TextStyleCaptions();
}

class TextStylesBody {
  final w400 = const TextStyle(fontSize: 28);
  final w700 = const TextStyle(fontSize: 28, fontWeight: FontWeight.w700);
}

class TextStyleTitles {
  final w400 = const TextStyle(fontSize: 20);
  final w500 = const TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
  final w600 = const TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  final w700 = const TextStyle(fontSize: 20, fontWeight: FontWeight.w700);
}

class TextStyleHeadlines {
  final w400 = const TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  final w500 = const TextStyle(fontSize: 16, fontWeight: FontWeight.w500);
}

class TextStyleLabels {
  final w400 = const TextStyle(fontSize: 14);
  final w500 = const TextStyle(fontSize: 14, fontWeight: FontWeight.w500);
  final w600 = const TextStyle(fontSize: 14, fontWeight: FontWeight.w600);
}

class TextStyleCaptions {
  final w400 = const TextStyle(fontSize: 12);
  final w500 = const TextStyle(fontSize: 12, fontWeight: FontWeight.w500);
}
