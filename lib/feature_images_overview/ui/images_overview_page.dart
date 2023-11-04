import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imgur/feature_images_overview/model/image_model.dart';
import 'package:imgur/feature_images_overview/ui/images_grid_view.dart';

import '../../assets.dart';
import '../../colors.dart';
import '../../strings.dart';
import '../bloc/fetch_images_cubit.dart';
import 'center_loading_view.dart';

class ImagesOverviewPage extends StatefulWidget {
  const ImagesOverviewPage({super.key});

  @override
  State<ImagesOverviewPage> createState() => _ImagesOverviewPageState();
}

class _ImagesOverviewPageState extends State<ImagesOverviewPage> {
  final Set<String> _suggestions = {};

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildSearchBar(),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: BlocBuilder<FetchImagesCubit, FetchImagesState>(
          builder: (context, state) {
            if (state is FetchImagesStateLoaded) {
              return ImageGridView(
                images: state.images,
                refresh: _refresh,
                addFavorites: (List<ImageModel> images) =>
                    FetchImagesCubit.of(context).addFavorites(images: images),
              );
            } else if (state is FetchImagesStateError) {
              return Center(
                child: Text(state.error.errorMessage ?? ''),
              );
            }
            return const CenterLoadingView();
          },
        ),
      ),
    );
  }

  PreferredSizeWidget _buildSearchBar() {
    return EasySearchBar(
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
  }

  void _refresh() => FetchImagesCubit.of(context).getPopularImages();
}
