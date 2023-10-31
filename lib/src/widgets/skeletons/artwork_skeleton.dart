import 'package:flutter/material.dart';

class ArtworkSkeleton extends StatelessWidget {
  const ArtworkSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onBackground,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 100,
              height: 100,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
        ],
      ),
    );
  }
}
