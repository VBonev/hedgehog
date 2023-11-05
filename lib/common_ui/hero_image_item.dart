import 'package:flutter/material.dart';

import '../../assets.dart';

class HeroImage extends StatelessWidget {
  const HeroImage({
    required this.imageUrl,
    super.key,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) => imageUrl != null
      ? Card(
          elevation: 10,
          child: Hero(
            tag: '$imageUrl',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, _) =>
                    Image.asset(placeholderImg),
              ),
            ),
          ),
        )
      : const SizedBox();
}
