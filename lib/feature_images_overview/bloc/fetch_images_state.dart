import 'package:freezed_annotation/freezed_annotation.dart';

part 'fetch_images_state.freezed.dart';

@freezed
class FetchImagesState with _$FetchImagesState {
  const factory FetchImagesState.initial() = FetchImagesStateInitial;

  const factory FetchImagesState.loading() = FetchImagesStateLoading;

  const factory FetchImagesState.loaded(
    List<String> images,
  ) = FetchImagesStateLoaded;

  const factory FetchImagesState.error({String? error}) = FetchImagesStateError;
}
