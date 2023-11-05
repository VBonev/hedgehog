import 'package:network/models/response/images_response.dart';

abstract class FetchImagesRepository {
  Future<ImagesResponse> getPopularImages();

  Future<ImagesResponse> searchImage(String query);
}
