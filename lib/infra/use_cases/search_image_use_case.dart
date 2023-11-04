import '../../feature_images_overview/model/image_model.dart';
import '../../feature_images_overview/repository/fetch_images_repository.dart';

import '../mapper/image_mapper.dart';

class SearchImageUseCase {
  const SearchImageUseCase(this.repository);

  final FetchImagesRepository repository;

  Future<List<ImageModel>> call(String query) async {
    final response = await repository.searchImage(query);
    return ImageMapper.map(response);
  }
}
