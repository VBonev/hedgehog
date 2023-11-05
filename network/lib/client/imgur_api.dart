import 'package:dio/dio.dart';
import 'package:network/client/server_methods.dart';
import 'package:retrofit/http.dart';

import 'enums.dart';
import '../models/response/images_response.dart';

part 'imgur_api.g.dart';

@RestApi()
abstract class ImgurApi {
  factory ImgurApi(Dio dio, {String baseUrl}) = _ImgurApi;

  @GET('$galleryPath$pathParams')
  Future<ImagesResponse> getPopularImages({
    @Path(sectionParam) required Section section,
    @Path(sortParam) required Sort sort,
    @Path(windowParam) required Window window,
    @Path(pageParam) required int page,
  });

  @GET('$searchPath$pathParams')
  Future<ImagesResponse> searchImage({
    @Path(sectionParam) required Section section,
    @Path(sortParam) required Sort sort,
    @Path(windowParam) required Window window,
    @Path(pageParam) required int page,
    @Query(query) required String query,
  });
}
