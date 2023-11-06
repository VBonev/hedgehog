import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imgur/infra/storage/shared_preferences_manager.dart';
import 'image_details_state.dart';

class ImageDetailsCubit extends Cubit<ImageDetailsState> {
  ImageDetailsCubit(
    this._sharedPreference,
  ) : super(const ImageDetailsState.favorite(false));

  final SharedPreferencesManager _sharedPreference;

  void checkIsImageFavorite({
    String? id,
  }) =>
      emit(
        ImageDetailsState.favorite(
          _sharedPreference.getFavoriteById(id) == true,
        ),
      );

  void setFavorite({
    String? id,
    required bool isFavorite,
  }) {
    _sharedPreference.setFavoriteById(id: id, isFavorite: isFavorite);
    emit(ImageDetailsState.favorite(isFavorite));
  }

  static ImageDetailsCubit of(BuildContext context) =>
      BlocProvider.of<ImageDetailsCubit>(context);
}
