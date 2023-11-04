import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imgur/feature_images_overview/model/image_model.dart';
import 'package:network/models/base/server_errors.dart';
import '../../infra/use_cases/add_favorites_use_case.dart';
import '../../infra/use_cases/get_images_use_case.dart';
import '../../infra/use_cases/search_image_use_case.dart';
import 'fetch_images_state.dart';

class FetchImagesCubit extends Cubit<FetchImagesState> {
  FetchImagesCubit({
    required this.getImageUseCase,
    required this.searchImageUseCase,
    required this.addFavoritesUseCase,
  }) : super(const FetchImagesState.initial());

  final GetImagesUseCase getImageUseCase;
  final SearchImageUseCase searchImageUseCase;
  final AddFavoritesUseCase addFavoritesUseCase;

  void getPopularImages() {
    _loadData(getImageUseCase());
  }

  void searchImage({
    required String query,
  }) {
    _loadData(searchImageUseCase(query));
  }

  void addFavorites({
    required List<ImageModel> images,
  }) =>
      emit(
        FetchImagesState.loaded(
          images,
        ),
      );

  Future<void> _loadData(Future loadData) async {
    try {
      emit(const FetchImagesState.loading());
      final data = await loadData;
      emit(FetchImagesState.loaded(data));
    } catch (error) {
      emit(FetchImagesState.error(error: ServerError.withError(error)));
    }
  }

  static FetchImagesCubit of(BuildContext context) =>
      BlocProvider.of<FetchImagesCubit>(context);
}
