import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imgur/common_ui/hero_image_item.dart';
import 'package:imgur/feature_images_overview/model/image_model.dart';
import 'package:imgur/infra/page_factory.dart';

import '../../colors.dart';
import '../../strings.dart';
import '../bloc/fetch_images_cubit.dart';
import '../bloc/fetch_images_state.dart';
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
    FetchImagesCubit.of(context).getPopularImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildSearchBar(),
      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: BlocBuilder<FetchImagesCubit, FetchImagesState>(
          builder: (context, state) => state.when(
            initial: () => const CenterLoadingView(),
            loading: () => const CenterLoadingView(),
            loaded: (images) => _buildGridView(images),
            error: (error) => Center(
              child: Text(error.errorMessage ?? ''),
            ),
          ),
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
            child: const Icon(Icons.manage_search),
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

  Widget _buildGridView(
    List<ImageModel> images,
  ) =>
      RefreshIndicator(
        onRefresh: () async => FetchImagesCubit.of(context).getPopularImages(),
        child: GridView.builder(
          itemCount: images.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          ),
          itemBuilder: (context, index) {
            return HeroImage(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageFactory.getImageDetails(
                    image: images[index],
                  ),
                ),
              ),
              imageUrl: images[index].link,
            );
          },
        ),
      );
}
