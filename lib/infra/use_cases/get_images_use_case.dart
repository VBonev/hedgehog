import '../../feature_images_overview/model/image_model.dart';
import '../../feature_images_overview/repository/fetch_images_repository.dart';
import '../mapper/image_mapper.dart';

class GetImagesUseCase {
  const GetImagesUseCase(this.repository);

  final FetchImagesRepository repository;

  Future<List<ImageModel>> call() async {
    final response = await repository.getPopularImages();
    return ImageMapper.map(response);
  }
}
