import 'package:flutter/material.dart';

class ToursPage extends StatelessWidget {
  const ToursPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Экскурсии',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
