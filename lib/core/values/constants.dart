import 'package:flutter/material.dart';

abstract class Paddings {
  static const double normal = 16;
  static const double small = 8;
}

// Links
final reportLink = Uri.parse('https://forms.gle/s64bkob2reo6d3th8');
final contactLink = Uri.parse('https://t.me/sfchv1');

// Paddings
const kPagePadding = EdgeInsets.all(Paddings.normal);
const kContainerPadding = EdgeInsets.all(kContainerRadius);

// Radiuses
final kFieldBorderRadius = BorderRadius.circular(10);
final kButtonBorderRadius = BorderRadius.circular(10);

const kContainerRadius = 10.0;
