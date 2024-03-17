import 'package:flutter/material.dart';
import 'package:street_art_witnesses/widgets/other/app_appbar.dart';

enum Paddings {
  small(10),
  big(20);

  const Paddings(this.value);
  final double value;
}

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.body, this.title, this.paddings = Paddings.big});

  final Widget body;
  final String? title;
  final Paddings paddings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(paddings.value),
              child: AppAppbar(
                title: title ?? '',
                leading: GestureDetector(
                  child: const Icon(Icons.arrow_back),
                  onTap: () => Navigator.pop(context),
                ),
              ),
            ),
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}
