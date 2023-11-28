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
  static const title1 =
      TextStyle(fontSize: 32, height: 1.25, fontWeight: FontWeight.bold);
  static const title2 =
      TextStyle(fontSize: 24, height: 1.25, fontWeight: FontWeight.w400);

  static const headline1 =
      TextStyle(fontSize: 20, height: 1.3, fontWeight: FontWeight.w600);
  static const headline2 =
      TextStyle(fontSize: 16, height: 1.25, fontWeight: FontWeight.w600);

  static const text = TextStyle(fontSize: 16, height: 1.25);
  static const button = TextStyle(fontSize: 16, height: 1.25);
  static const input = TextStyle(fontSize: 16, height: 1.25);

  static const textAdditional =
      TextStyle(fontSize: 14, height: 1.4, fontWeight: FontWeight.w500);
  static const caption = TextStyle(fontSize: 12, height: 1);
}
