import 'package:flutter/material.dart';

import '../../assets.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({
    required this.image,
    this.onTap,
    super.key,
  });

  final String image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Hero(
        tag: image,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                image,
                fit: BoxFit.fitWidth,
                errorBuilder: (context, error, _) =>
                    Image.asset(imagePlaceholder),
              ),
            ),
          ),
        ),
      );
}
