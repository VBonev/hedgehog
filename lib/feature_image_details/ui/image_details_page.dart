import 'package:flutter/material.dart';
import 'package:imgur/feature_image_details/ui/favorite_button.dart';
import 'package:imgur/common_models/image_model.dart';
import 'package:imgur/infra/storage/shared_preferences_manager.dart';

import '../../colors.dart';
import '../../common_ui/hero_image_item.dart';
import '../../strings.dart';
import 'icon_button.dart';

class ImageDetailsPage extends StatefulWidget {
  const ImageDetailsPage({
    required this.image,
    super.key,
  });

  final ImageModel? image;

  @override
  State<ImageDetailsPage> createState() => _ImageDetailsPageState();
}

class _ImageDetailsPageState extends State<ImageDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var isFavorite = widget.image?.isFavorite == true;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(detailsTitle),
        iconTheme: const IconThemeData(
          size: 24,
          color: AppColors.white,
        ),
        titleTextStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 20,
        ),
      ),
      body: _buildBody(isFavorite),
    );
  }

  SingleChildScrollView _buildBody(bool isFavorite) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                widget.image?.title ?? '',
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: HeroImage(imageUrl: widget.image?.link),
            ),
            _buildButtonsBar(isFavorite),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonsBar(bool isFavorite) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: AppColors.primary,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FavoriteButton(
                  onTap: () {
                    SharedPreferencesManager.of(context).changeFavorites(
                        id: widget.image?.id, isFavorite: !isFavorite);
                    setState(() => widget.image?.isFavorite = !isFavorite);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(favoriteToast(isFavorite)),
                      duration: const Duration(milliseconds: 500),
                    ));
                  },
                  isSelected: isFavorite,
                ),
                IconLabelView(
                  icon: Icons.remove_red_eye_rounded,
                  value: widget.image?.views,
                  label: viewsLabel,
                ),
                IconLabelView(
                  icon: Icons.bolt_rounded,
                  value: widget.image?.score,
                  label: scoreLabel,
                ),
              ]),
        ),
      );
}
