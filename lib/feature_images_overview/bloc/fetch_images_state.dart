import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:imgur/feature_images_overview/model/image_model.dart';
import 'package:network/models/base/server_errors.dart';

part 'fetch_images_state.freezed.dart';

@freezed
class FetchImagesState with _$FetchImagesState {
  const factory FetchImagesState.initial() = FetchImagesStateInitial;

  const factory FetchImagesState.loading() = FetchImagesStateLoading;

  const factory FetchImagesState.loaded(
    List<ImageModel> images,
  ) = FetchImagesStateLoaded;

  const factory FetchImagesState.error({required ServerError error}) =
      FetchImagesStateError;
}
