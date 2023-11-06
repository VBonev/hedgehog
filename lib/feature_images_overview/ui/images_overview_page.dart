import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imgur/common_models/image_model.dart';
import 'package:imgur/feature_images_overview/ui/images_grid_view.dart';

import '../../assets.dart';
import '../../colors.dart';
import '../../strings.dart';
import '../cubit/fetch_images_cubit.dart';
import '../cubit/fetch_images_state.dart';
import 'center_loading_view.dart';

class ImagesOverviewPage extends StatefulWidget {
  const ImagesOverviewPage({super.key});

  @override
  State<ImagesOverviewPage> createState() => _ImagesOverviewPageState();
}

class _ImagesOverviewPageState extends State<ImagesOverviewPage> {
  final Set<String> _suggestions = {};

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _buildSearchBar(),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: BlocBuilder<FetchImagesCubit, FetchImagesState>(
            builder: (context, state) =>
                state.whenOrNull(
                  loaded: (images) => ImageGridView(
                    images: images,
                    refresh: _fetchImages,
                    addFavorites: (List<ImageModel> images) =>
                        FetchImagesCubit.of(context).addFavorites(
                      images: images,
                    ),
                  ),
                  error: (error) => Center(
                    child: Text(
                      error.errorMessage ?? '',
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ) ??
                const CenterLoadingView(),
          ),
        ),
      );

  PreferredSizeWidget _buildSearchBar() => EasySearchBar(
        debounceDuration: const Duration(seconds: 10),
        actions: [
          Tooltip(
            message: clearHistoryTooltip,
            child: InkWell(
              onTap: () {
                var message =
                    _suggestions.isEmpty ? noSearchLabel : clearHistoryLabel;
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(message),
                ));
                setState(
                  () => _suggestions.clear(),
                );
              },
              child: Image.asset(
                clearHistoryImg,
                color: Colors.white,
                width: 20,
                height: 20,
              ),
            ),
          )
        ],
        title: const Text(
          appTitle,
        ),
        titleTextStyle: const TextStyle(
          color: AppColors.white,
          fontSize: 20,
        ),
        searchBackgroundColor: AppColors.white,
        suggestionBackgroundColor: AppColors.white,
        iconTheme: const IconThemeData(
          size: 24,
          color: AppColors.white,
        ),
        onSearch: (value) {
          if (value.isNotEmpty) {
            setState(() => _suggestions.add(value));
            FetchImagesCubit.of(context).searchImage(
              query: value,
            );
          }
        },
        suggestions: _suggestions.toList(),
      );

  void _fetchImages() => FetchImagesCubit.of(context).getPopularImages();
}
