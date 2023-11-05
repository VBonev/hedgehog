import '../../common_models/image_model.dart';
import '../repositories/fetch_images/fetch_images_repository.dart';
import '../mapper/image_mapper.dart';
import 'add_favorites_use_case.dart';

class GetImagesUseCase {
  const GetImagesUseCase(
    this._repository,
    this._addFavoritesUseCase,
  );

  final FetchImagesRepository _repository;
  final AddFavoritesUseCase _addFavoritesUseCase;

  Future<List<ImageModel>> call() async {
    final response = await _repository.getPopularImages();
    return _addFavoritesUseCase(ImageMapper.map(response));
  }
}
