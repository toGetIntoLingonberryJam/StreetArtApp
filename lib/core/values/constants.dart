import 'package:flutter/material.dart';

// Links
final reportLink = Uri.parse('https://forms.gle/s64bkob2reo6d3th8');
final contactLink = Uri.parse('https://t.me/sfchv1');

// Paddings
abstract class Paddings {
  static const double normal = 16;
  static const double small = 8;
}

const kPagePadding = EdgeInsets.fromLTRB(Paddings.normal, 0, Paddings.normal, Paddings.normal);
const kDensePagePadding = EdgeInsets.fromLTRB(Paddings.small, 0, Paddings.small, Paddings.small);
const kContainerPadding = EdgeInsets.all(kContainerRadius);

// Radiuses
final kFieldBorderRadius = BorderRadius.circular(10);
final kButtonBorderRadius = BorderRadius.circular(10);

const kContainerRadius = 10.0;
