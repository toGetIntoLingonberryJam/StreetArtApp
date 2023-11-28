import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

class AppListTile extends StatelessWidget {
  const AppListTile({
    super.key,
    required this.iconData,
    required this.text,
    this.onTap,
    this.foregroundColor,
    this.notificationsCount,
  });

  final IconData iconData;
  final String text;
  final VoidCallback? onTap;
  final Color? foregroundColor;
  final int? notificationsCount;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap ?? () => Utils.showMessage(context, text),
      child: Ink(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(iconData, color: foregroundColor),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: TextStyles.text.copyWith(
                  color: foregroundColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (notificationsCount != null && notificationsCount! > 0)
              _Badge(notificationsCount!),
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  const _Badge(this.count);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.error,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        '$count',
        style: TextStyles.textAdditional.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
