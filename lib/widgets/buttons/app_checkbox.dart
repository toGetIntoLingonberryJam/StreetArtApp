import 'package:flutter/material.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox({super.key, this.value = false, required this.onChanged});

  final bool value;
  final void Function(bool value) onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(4),
      child: Ink(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        child: value
            ? const Icon(
                Icons.check_rounded,
                color: Colors.black,
                size: 18,
              )
            : null,
      ),
    );
  }
}
