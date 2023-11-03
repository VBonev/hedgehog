import '../feature_images_overview/repository/fetch_images_repository.dart';

class FetchImagesRepositoryImpl extends FetchImagesRepository {
// TODO add network implementation
  @override
  Future<List<String>> getPopularImages() {
    return Future.value([]);
  }

  @override
  Future<List<String>> searchImage(String query) {
    return Future.value([]);
  }
}
