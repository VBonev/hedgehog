import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:imgur/feature_image_details/ui/image_details_page.dart';
import 'package:imgur/feature_images_overview/model/image_model.dart';

import '../feature_images_overview/bloc/fetch_images_cubit.dart';
import '../feature_images_overview/ui/images_overview_page.dart';

class PageFactory {
  static final getIt = GetIt.instance;

  static Widget getImagesOverview() => BlocProvider(
        create: (context) => getIt.get<FetchImagesCubit>(),
        child: const ImagesOverviewPage(),
      );

  static Widget getImageDetails({ImageModel? image}) =>
      ImageDetailsPage(image: image);
}
