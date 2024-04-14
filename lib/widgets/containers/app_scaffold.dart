import 'package:flutter/material.dart';
import 'package:street_art_witnesses/widgets/other/app_header.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.body, this.title, this.paddings});

  final Widget body;
  final String? title;
  final EdgeInsets? paddings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: title ?? '',
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: paddings ?? EdgeInsets.zero,
        child: Expanded(child: body),
      ),
    );
  }
}
