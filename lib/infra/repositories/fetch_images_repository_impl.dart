import 'package:network/client/client.dart';
import 'package:network/models/response/images_response.dart';

import '../../feature_images_overview/repository/fetch_images_repository.dart';

class FetchImagesRepositoryImpl extends FetchImagesRepository {
  FetchImagesRepositoryImpl(
     this._client,
  );

  final NetworkClient _client;

  @override
  Future<ImagesResponse> getPopularImages() => _client.getPopularImages();

  @override
  Future<ImagesResponse> searchImage(String query) => _client.searchImage(
        query: query,
      );
}
