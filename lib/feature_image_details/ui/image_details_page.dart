import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imgur/feature_image_details/cubit/image_details_cubit.dart';
import 'package:imgur/feature_image_details/cubit/image_details_state.dart';
import 'package:imgur/feature_image_details/ui/favorite_button.dart';
import 'package:imgur/common_models/image_model.dart';

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
  Widget build(BuildContext context) => Scaffold(
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
        body: _buildBody(),
      );

  Widget _buildBody() => SingleChildScrollView(
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
              _buildButtonsBar(),
            ],
          ),
        ),
      );

  Widget _buildButtonsBar() => Container(
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
                BlocBuilder<ImageDetailsCubit, ImageDetailsState>(
                  builder: (context, state) => FavoriteButton(
                    onTap: () {
                      ImageDetailsCubit.of(context).setFavorite(
                        id: widget.image?.id,
                        isFavorite: state.isFavorite == false,
                      );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(favoriteToast(state.isFavorite)),
                        duration: const Duration(milliseconds: 500),
                      ));
                    },
                    isSelected: state.isFavorite,
                  ),
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
