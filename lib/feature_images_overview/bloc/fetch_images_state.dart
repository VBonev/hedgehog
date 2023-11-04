
part of 'fetch_images_cubit.dart';

abstract class FetchImagesState {
  const FetchImagesState();
}

class FetchImagesStateInitial extends FetchImagesState {
  const FetchImagesStateInitial();
}

class FetchImagesStateLoading extends FetchImagesState {
  const FetchImagesStateLoading();
}

class FetchImagesStateLoaded extends FetchImagesState {
  const FetchImagesStateLoaded(this.images);

  final List<ImageModel> images;
}

class FetchImagesStateError extends FetchImagesState {
  const FetchImagesStateError({required this.error});

  final ServerError error;
}
