import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/widgets/app_widgets.dart';

class LoadingImageCircleAvatar extends StatelessWidget {
  const LoadingImageCircleAvatar({super.key, required this.imageUrl, this.radius = 12});

  final String? imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) return AppCircleAvatar(image: AppPlaceholder.assetImage(), radius: radius);
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: SizedBox(width: radius * 2, height: radius * 2, child: LoadingImage.fromPreviewUrl(imageUrl!)),
    );
  }
}

class AppCircleAvatar extends StatelessWidget {
  const AppCircleAvatar({super.key, this.bgColor, this.image, this.radius = 12, this.child});

  final double radius;
  final Color? bgColor;
  final ImageProvider<Object>? image;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      foregroundImage: image,
      backgroundColor: bgColor ?? UIColors.slider,
      child: child,
    );
  }
}

class AppMarkerAvatar extends StatelessWidget {
  const AppMarkerAvatar({
    super.key,
    this.bgColor,
    this.image,
    this.child,
    this.radius = 12,
  }) : assert(image == null || child == null);

  final double radius;
  final Color? bgColor;
  final ImageProvider<Object>? image;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: bgColor ?? UIColors.purple,
      radius: radius + 0.5,
      child: CircleAvatar(
        radius: radius,
        foregroundImage: image,
        backgroundColor: Colors.transparent,
        child: child,
      ),
    );
  }
}
