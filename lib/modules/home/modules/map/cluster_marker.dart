import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';

/// Виджет для отображения кластера
class ClusterMarker extends StatelessWidget {
  const ClusterMarker({super.key, required this.markersLength});

  /// Количество маркеров, объединенных в кластер
  final int markersLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: UIColors.accent.withOpacity(0.6),
        shape: BoxShape.circle,
        border: Border.all(color: UIColors.accent, width: 3),
      ),
      child: Center(
        child: Text('$markersLength', style: NewTextStyles.bodyBold),
      ),
    );
  }
}
