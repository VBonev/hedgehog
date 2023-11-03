import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imgur/common_ui/hero_image_item.dart';

import '../../feature_image_details/ui/image_details_page.dart';
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
      body: ColoredBox(
        color: Colors.white60,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: BlocBuilder<FetchImagesCubit, FetchImagesState>(
              builder: (context, state) => state.when(
                  initial: () => const CenterLoadingView(),
                  loading: () => const CenterLoadingView(),
                  loaded: (images) => _buildGridView(images),
                  error: (error) => const SizedBox())),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildSearchBar() {
    return EasySearchBar(
      actions: [
        Tooltip(
          message: clearHistoryTooltip,
          child: InkWell(
            onTap: () {
              setState(
                () => _suggestions.clear(),
              );
              var message =
                  _suggestions.isEmpty ? noSearchLabel : clearHistoryLabel;
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(message),
              ));
            },
            child: const Icon(Icons.manage_search),
          ),
        )
      ],
      title: const Text(
        appTitle,
      ),
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      iconTheme: const IconThemeData(
        size: 24,
        color: Colors.white,
      ),
      onSearch: (value) {
        setState(() => _suggestions.add(value));
        FetchImagesCubit.of(context).searchImage(
          query: value,
        );
      },
      suggestions: _suggestions.toList(),
    );
  }

  GridView _buildGridView(List<String> images) {
    return GridView.builder(
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
              builder: (context) => ImageDetailsPage(
                image: images[index],
              ),
            ),
          ),
          image: images[index],
        );
      },
    );
  }
}
