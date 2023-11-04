import '../../feature_images_overview/model/image_model.dart';
import '../../feature_images_overview/repository/fetch_images_repository.dart';

import '../mapper/image_mapper.dart';
import 'add_favorites_use_case.dart';

class SearchImageUseCase {
  const SearchImageUseCase(
    this._repository,
    this._addFavoritesUseCase,
  );

  final FetchImagesRepository _repository;
  final AddFavoritesUseCase _addFavoritesUseCase;

  Future<List<ImageModel>> call(String query) async {
    final response = await _repository.searchImage(query);
    return _addFavoritesUseCase(ImageMapper.map(response));
  }
}
