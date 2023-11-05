import '../../common_models/image_model.dart';
import '../mapper/image_mapper.dart';
import '../storage/shared_preferences_manager.dart';

class AddFavoritesUseCase {
  const AddFavoritesUseCase(
    this._sharedPreferences,
  );

  final SharedPreferencesManager _sharedPreferences;

  List<ImageModel> call(List<ImageModel> images) => ImageMapper.addFavorites(
        images,
        _sharedPreferences.getFavorites(),
      );
}
