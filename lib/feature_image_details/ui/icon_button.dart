import 'package:flutter/material.dart';

import '../../colors.dart';

class IconLabelView extends StatelessWidget {
  const IconLabelView({
    required this.icon,
    this.label,
    this.value,
    super.key,
  });

  final IconData icon;

  final int? value;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return value != null
        ? Tooltip(
            message: label,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 26,
                    color: AppColors.white,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '$value',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
