import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Что-то пошло не так. :(',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
