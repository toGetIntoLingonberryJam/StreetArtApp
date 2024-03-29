import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/modules/user/controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ProfileController>(
          builder: (controller) => controller.view,
        ),
      ),
    );
  }
}
