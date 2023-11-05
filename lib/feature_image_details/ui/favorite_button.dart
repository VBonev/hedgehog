import 'package:flutter/material.dart';

import '../../colors.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    required this.isSelected,
    this.size = 40,
    this.onTap,
    super.key,
  });

  final VoidCallback? onTap;
  final bool isSelected;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Icon(
          isSelected == true ? Icons.star_rounded : Icons.star_outline_rounded,
          size: size,
          color: AppColors.gold,
        ),
      ),
    );
  }
}
