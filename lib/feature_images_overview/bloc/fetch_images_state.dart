import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:network/models/base/server_errors.dart';

import '../../common_models/image_model.dart';

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
