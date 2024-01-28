import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';

class AppAppbar extends StatelessWidget {
  const AppAppbar({
    super.key,
    required this.title,
    this.leading,
    this.action,
    this.autoImplyLeading = true,
  });

  final String title;
  final Widget? leading;
  final Widget? action;
  final bool autoImplyLeading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Row(
        children: [
          SizedBox(
            width: 24,
            child: leading ?? (autoImplyLeading ? _backButton(context) : null),
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyles.headline1,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(width: 24, child: action),
        ],
      ),
    );
  }

  Widget? _backButton(BuildContext context) {
    if (Navigator.of(context).canPop()) {
      return GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(Icons.arrow_back),
      );
    }
    return null;
  }
}
