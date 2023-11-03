abstract class FetchImagesRepository {
  Future<void> getPopularImages();

  Future<void> searchImage(String query);
}
