import 'package:flutter/material.dart';
import 'package:street_art_witnesses/widgets/other/app_appbar.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.body, this.title});

  final Widget body;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
