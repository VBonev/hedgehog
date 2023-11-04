import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:network/models/response/images_response.dart';

import '../../assets.dart';
import '../../feature_images_overview/repository/fetch_images_repository.dart';

class FetchImagesRepositoryMock extends FetchImagesRepository {
  @override
  Future<ImagesResponse> getPopularImages() async {
    return await _getMockData();
  }

  @override
  Future<ImagesResponse> searchImage(String query) async {
    return await _getMockData();
  }

  Future<ImagesResponse> _getMockData() async {
    final String response = await rootBundle.loadString(imagesJson);
    final data = await json.decode(response);
    return ImagesResponse.fromJson(data);
  }
}
