import 'package:flutter/material.dart';

// TextStyles
abstract class TextStyles {
  static const title1 = TextStyle(
    fontSize: 32,
    height: 1.25,
    fontWeight: FontWeight.bold,
    fontFamily: 'Inter',
  );
  static const title2 = TextStyle(
    fontSize: 24,
    height: 1.25,
    fontWeight: FontWeight.w400,
    fontFamily: 'Inter',
  );

  static const headline1 = TextStyle(
    fontSize: 20,
    height: 1.3,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );
  static const headline2 = TextStyle(
    fontSize: 16,
    height: 1.25,
    fontWeight: FontWeight.w600,
    fontFamily: 'Inter',
  );

  static const text = TextStyle(fontSize: 16, height: 1.25, fontFamily: 'Inter');
  static const button = TextStyle(fontSize: 16, height: 1.25, fontFamily: 'Inter');
  static const input = TextStyle(fontSize: 16, height: 1.25, fontFamily: 'Inter');

  static const textAdditional = TextStyle(
    fontSize: 14,
    height: 1.4,
    fontWeight: FontWeight.w500,
    fontFamily: 'Inter',
  );
  static const caption = TextStyle(fontSize: 12, height: 1, fontFamily: 'Inter');
}
