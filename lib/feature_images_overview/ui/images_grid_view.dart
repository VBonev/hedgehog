import 'package:flutter/material.dart';

import '../../colors.dart';
import '../../common_ui/hero_image_item.dart';
import '../../feature_image_details/ui/favorite_button.dart';
import '../../infra/page_factory.dart';
import '../../common_models/image_model.dart';

class ImageGridView extends StatelessWidget {
  const ImageGridView({
    required this.images,
    required this.refresh,
    required this.addFavorites,
    super.key,
  });

  final List<ImageModel> images;
  final VoidCallback refresh;
  final Function(List<ImageModel> images) addFavorites;

  @override
  Widget build(BuildContext context) => images.isNotEmpty
      ? RefreshIndicator(
          onRefresh: () async => refresh(),
          child: GridView.builder(
            itemCount: images.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
            itemBuilder: (context, index) {
              var image = images[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PageFactory.getImageDetails(
                      image: image,
                    ),
                  ),
                ).then(
                  (value) => addFavorites(images),
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      child: HeroImage(
                        imageUrl: image.link,
                      ),
                    ),
                    if (image.isFavorite == true)
                      const Positioned(
                        bottom: 10,
                        left: 10,
                        child: Card(
                          elevation: 10,
                          color: AppColors.red,
                          child: FavoriteButton(
                            isSelected: true,
                            size: 34,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        )
      : const Center(
          child: Text(
            'There are no images',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 30,
            ),
          ),
        );
}
