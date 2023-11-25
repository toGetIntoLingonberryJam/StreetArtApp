import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Что-то пошло не так. :(',
        style: TextStyles.titles.w400,
      ),
    );
  }
}
