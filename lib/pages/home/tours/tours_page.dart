import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';

class ToursPage extends StatelessWidget {
  const ToursPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Экскурсии',
          style: TextStyles.titles.w400,
        ),
      ),
    );
  }
}
