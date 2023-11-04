import '../../feature_images_overview/model/image_model.dart';
import '../mapper/image_mapper.dart';
import '../storage/shared_preferences_manager.dart';

class AddFavoritesUseCase {
  const AddFavoritesUseCase(
    this._sharedPreferences,
  );

  final SharedPreferencesManager _sharedPreferences;

  List<ImageModel> call(List<ImageModel> images) {
    final favorites = _sharedPreferences.getFavorites();
    return ImageMapper.addFavorites(images, favorites);
  }
}
