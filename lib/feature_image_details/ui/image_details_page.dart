import 'package:flutter/material.dart';

import '../../common_ui/hero_image_item.dart';
import '../../strings.dart';

class ImageDetailsPage extends StatelessWidget {
  const ImageDetailsPage({
    required this.imageUrl,
    super.key,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(detailsTitle),
        iconTheme: const IconThemeData(
          size: 24,
          color: Colors.white,
        ),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: HeroImage(imageUrl: imageUrl),
      ),
    );
  }
}
