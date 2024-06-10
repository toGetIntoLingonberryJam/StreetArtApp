import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/extensions.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/modules/wide_screen/wide_home_controller.dart';

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
        padding: const EdgeInsets.all(Paddings.normal),
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
                  style: NewTextStyles.title3Regular,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: _height, child: action),
            ],
          ),
        ),
      ),
    );
  }

  Widget? _backButton(BuildContext context) => GestureDetector(onTap: _back, child: const Icon(Icons.arrow_back));

  void _back() {
    if (kIsWeb) {
      Get.find<WideHomeController>().back();
    } else {
      closeScreen();
    }
  }

  @override
  Size get preferredSize => const Size.fromHeight(_height + 2 * Paddings.normal);
}
