import 'package:freezed_annotation/freezed_annotation.dart';
part 'image_details_state.freezed.dart';

@freezed
class ImageDetailsState with _$ImageDetailsState {
  const factory ImageDetailsState.favorite(
    bool isFavorite,
  ) = ImageDetailsStateFavorite;
}
