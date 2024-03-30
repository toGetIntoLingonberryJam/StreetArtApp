import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  const AppHeader({
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

  static const double _height = 26;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: SizedBox(
          height: _height,
          child: Row(
            children: [
              SizedBox(
                width: _height,
                child: leading ?? (autoImplyLeading ? _backButton(context) : null),
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyles.headline1,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(width: _height, child: action),
            ],
          ),
        ),
      ),
    );
  }

  Widget? _backButton(BuildContext context) => GestureDetector(
        onTap: Get.back,
        child: const Icon(Icons.arrow_back),
      );

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(66);
}
