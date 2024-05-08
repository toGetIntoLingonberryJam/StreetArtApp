import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';

class ToursPage extends StatelessWidget {
  const ToursPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Экскурсии',
          style: NewTextStyles.title3Regular,
        ),
      ),
    );
  }
}
