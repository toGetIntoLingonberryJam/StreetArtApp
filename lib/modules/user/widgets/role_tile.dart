import 'package:flutter/material.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';

class RoleTile extends StatelessWidget {
  const RoleTile({
    super.key,
    required this.role,
  });

  final String role;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: UIColors.backgroundCard,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              role,
              style: NewTextStyles.bodyBold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
