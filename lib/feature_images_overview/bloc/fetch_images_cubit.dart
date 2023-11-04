import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network/models/base/server_errors.dart';
import '../../infra/use_cases/get_images_use_case.dart';
import '../../infra/use_cases/search_image_use_case.dart';
import 'fetch_images_state.dart';

class FetchImagesCubit extends Cubit<FetchImagesState> {
  FetchImagesCubit({
    required this.getImageUseCase,
    required this.searchImageUseCase,
  }) : super(const FetchImagesState.initial());

  final GetImagesUseCase getImageUseCase;
  final SearchImageUseCase searchImageUseCase;

  void getPopularImages() {
    loadData(getImageUseCase());
  }

  void searchImage({required String query}) {
    loadData(searchImageUseCase(query));
  }

  Future<void> loadData(Future loadData) async {
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
