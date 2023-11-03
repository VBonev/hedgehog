import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../repository/fetch_images_repository.dart';
import 'fetch_images_state.dart';

class FetchImagesCubit extends Cubit<FetchImagesState> {
  FetchImagesCubit(
    this._repository,
  ) : super(const FetchImagesState.initial());

  final FetchImagesRepository _repository;

  void getPopularImages() {
    loadData(_repository.getPopularImages());
  }

  void searchImage({required String query}) {
    loadData(_repository.searchImage(query));
  }

  Future<void> loadData(Future loadData) async {
    try {
      emit(const FetchImagesState.loading());
      final data = await loadData;
      await Future.delayed(const Duration(seconds:2));
      emit(FetchImagesState.loaded(data));
    } catch (error) {
      emit(const FetchImagesState.error(error: 'Error'));
    }
  }

  static FetchImagesCubit of(BuildContext context) =>
      BlocProvider.of<FetchImagesCubit>(context);
}
