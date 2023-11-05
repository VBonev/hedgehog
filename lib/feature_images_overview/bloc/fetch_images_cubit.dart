import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imgur/common_models/image_model.dart';
import 'package:network/models/base/server_errors.dart';
import '../../infra/use_cases/add_favorites_use_case.dart';
import '../../infra/use_cases/fetch_images_use_case.dart';
import '../../infra/use_cases/search_image_use_case.dart';
import 'fetch_images_state.dart';

class FetchImagesCubit extends Cubit<FetchImagesState> {
  FetchImagesCubit({
    required this.getImageUseCase,
    required this.searchImageUseCase,
    required this.addFavoritesUseCase,
  }) : super(const FetchImagesStateLoading());

  final FetchImagesUseCase getImageUseCase;
  final SearchImageUseCase searchImageUseCase;
  final AddFavoritesUseCase addFavoritesUseCase;

  void getPopularImages() => _loadData(getImageUseCase());

  void searchImage({required String query}) =>
      _loadData(searchImageUseCase(query));

  void addFavorites({required List<ImageModel> images}) {
    emit(const FetchImagesStateLoaded([]));
    emit(FetchImagesStateLoaded(addFavoritesUseCase(images)));
  }

  Future<void> _loadData(Future loadData) async {
    try {
      emit(const FetchImagesStateLoading());
      final data = await loadData;
      emit(FetchImagesStateLoaded(data));
    } catch (error) {
      emit(FetchImagesStateError(error: ServerError.withError(error)));
    }
  }

  static FetchImagesCubit of(BuildContext context) =>
      BlocProvider.of<FetchImagesCubit>(context);
}
