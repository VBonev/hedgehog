import 'package:network/client/client.dart';
import 'package:network/models/response/images_response.dart';

import '../feature_images_overview/repository/fetch_images_repository.dart';

class FetchImagesRepositoryImpl extends FetchImagesRepository {
  FetchImagesRepositoryImpl({
    required this.client,
  });

  final NetworkClient client;

  @override
  Future<ImagesResponse> getPopularImages() => client.getPopularImages();

  @override
  Future<ImagesResponse> searchImage(String query) => client.searchImage(
        query: query,
      );
}
