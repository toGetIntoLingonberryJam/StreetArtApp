import 'package:flutter/material.dart';

// NewTextStyles
abstract class NewTextStyles {
  static const largeTitleRegular = TextStyle(fontSize: 34, height: 41 / 34, fontFamily: 'Inter');
  static const largeTitleBold = TextStyle(fontSize: 34, height: 41 / 34, fontFamily: 'Inter', fontWeight: FontWeight.w700);

  static const title1Regular = TextStyle(fontSize: 30, height: 36 / 30, fontFamily: 'Inter');
  static const title1Semibold = TextStyle(fontSize: 30, height: 36 / 30, fontFamily: 'Inter', fontWeight: FontWeight.w600);
  static const title2Regular = TextStyle(fontSize: 24, height: 28 / 24, fontFamily: 'Inter');
  static const title2Semibold = TextStyle(fontSize: 24, height: 28 / 24, fontFamily: 'Inter', fontWeight: FontWeight.w600);
  static const title3Regular = TextStyle(fontSize: 20, height: 24 / 20, fontFamily: 'Inter');
  static const title3Bold = TextStyle(fontSize: 20, height: 24 / 20, fontFamily: 'Inter', fontWeight: FontWeight.w700);

  static const headlineRegular = TextStyle(fontSize: 17, height: 22 / 17, fontFamily: 'Inter');
  static const headlineMedium = TextStyle(fontSize: 17, height: 22 / 17, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  static const headlineBold = TextStyle(fontSize: 17, height: 22 / 17, fontFamily: 'Inter', fontWeight: FontWeight.w600);

  static const bodyRegular = TextStyle(fontSize: 16, height: 21 / 16, fontFamily: 'Inter');
  static const bodyBold = TextStyle(fontSize: 16, height: 21 / 16, fontFamily: 'Inter', fontWeight: FontWeight.w500);

  static const subheadRegular = TextStyle(fontSize: 15, height: 20 / 15, fontFamily: 'Inter');
  static const subheadMedium = TextStyle(fontSize: 15, height: 20 / 15, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  static const subheadMediumUnderline = TextStyle(
    fontSize: 15,
    height: 20 / 15,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
  );
  static const subheadBold = TextStyle(fontSize: 15, height: 20 / 15, fontFamily: 'Inter', fontWeight: FontWeight.w700);

  static const footnoteRegular = TextStyle(fontSize: 13, height: 16 / 13, fontFamily: 'Inter');
  static const footnoteSemibold = TextStyle(fontSize: 13, height: 16 / 13, fontFamily: 'Inter', fontWeight: FontWeight.w600);

  static const caption1Regular = TextStyle(fontSize: 12, height: 14 / 12, fontFamily: 'Inter');
  static const caption1Semibold = TextStyle(fontSize: 12, height: 14 / 12, fontFamily: 'Inter', fontWeight: FontWeight.w500);

  static const caption2Regular = TextStyle(fontSize: 11, height: 13 / 11, fontFamily: 'Inter');
  static const caption2Medium = TextStyle(fontSize: 11, height: 13 / 11, fontFamily: 'Inter', fontWeight: FontWeight.w500);

  static const caption3Regular = TextStyle(fontSize: 9, height: 12 / 9, fontFamily: 'Inter');
}

// Old TextStyles
@Deprecated('Use NewTextStyles instead')
abstract class TextStyles {
  static const title1 = TextStyle(fontSize: 32, height: 1.25, fontWeight: FontWeight.bold, fontFamily: 'Inter');
  static const title2 = TextStyle(fontSize: 24, height: 1.25, fontWeight: FontWeight.w400, fontFamily: 'Inter');

  static const headline1 = TextStyle(fontSize: 20, height: 1.3, fontWeight: FontWeight.w600, fontFamily: 'Inter');
  static const headline2 = TextStyle(fontSize: 16, height: 1.25, fontWeight: FontWeight.w600, fontFamily: 'Inter');

  static const text = TextStyle(fontSize: 16, height: 1.25, fontFamily: 'Inter');
  static const button = TextStyle(fontSize: 16, height: 1.25, fontFamily: 'Inter');
  static const input = TextStyle(fontSize: 16, height: 1.25, fontFamily: 'Inter');

  static const textAdditional = TextStyle(fontSize: 14, height: 1.4, fontWeight: FontWeight.w500, fontFamily: 'Inter');
  static const caption = TextStyle(fontSize: 12, height: 1, fontFamily: 'Inter');
}
