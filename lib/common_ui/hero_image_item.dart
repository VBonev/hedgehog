import 'package:flutter/material.dart';

import '../../assets.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({
    required this.imageUrl,
    this.onTap,
    super.key,
  });

  final String? imageUrl;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Hero(
        tag: '$imageUrl',
        child: Material(
          child: InkWell(
            onTap: onTap,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageUrl!,
                  fit: BoxFit.fitWidth,
                  errorBuilder: (context, error, _) =>
                      Image.asset(placeholderImg),
                )),
          ),
        ),
      );
}
