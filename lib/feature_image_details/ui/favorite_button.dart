import 'package:flutter/material.dart';

import '../../colors.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    required this.onTap,
    required this.isSelected,
    super.key,
  });

  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      child: InkWell(
        onTap: onTap,
        child: Icon(
          isSelected == true
              ? Icons.star_rounded
              : Icons.star_outline_rounded,
          size: 40,
          color: AppColors.white,
        ),
      ),
    );
  }
}
