import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({
    super.key,
    required this.onButtonClicked,
    required this.content,
  });

  final VoidCallback onButtonClicked;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Expanded(
                flex: 4,
                child: Image(image: AssetImage('assets/logo.png')),
              ),
              const SizedBox(height: 40),
              const Text(
                'Свидетели Стрит-Арта',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Text(
                content,
                style: const TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
              const Expanded(flex: 2, child: SizedBox()),
              FilledButton.tonal(
                style: FilledButton.styleFrom(
                  minimumSize: const Size(300, 45),
                ),
                onPressed: onButtonClicked,
                child: const Text(
                  'Далее',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              const Expanded(flex: 2, child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
