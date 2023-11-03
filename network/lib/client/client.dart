import 'package:dio/dio.dart';
import 'package:network/client/log_interceptor.dart';
import 'package:network/client/imgur_api.dart';

import '../models/base/server_errors.dart';
import 'enums.dart';

class NetworkClient {
  NetworkClient(this.baseUrl);

  String baseUrl;
  final Dio _client = Dio(
    BaseOptions(
      contentType: 'application/json',
      receiveTimeout: Duration(microseconds: 5000),
      headers: {
        'Authorization': 'Bearer 84a12992c0d4e6ee333efab22a533e054ac49a3a'
      },
    ),
  )..interceptors.add(LoggingInterceptor());

  ImgurApi get imgurApi => ImgurApi(
        _client,
        baseUrl: baseUrl,
      );

  Future<T> getPopularImages<T>() async =>
      triggerCall(imgurApi.getPopularImages(
        section: Section.hot,
        sort: Sort.top,
        window: Window.all,
        page: 1,
      ) as Future<T>);

  Future<T> searchImage<T>({
    required String query,
  }) async =>
      triggerCall(imgurApi.searchImage(
        section: Section.hot,
        sort: Sort.top,
        window: Window.all,
        page: 1,
        query: query,
      ) as Future<T>);

  Future<T> triggerCall<T>(Future<T> apiCall) async {
    try {
      final response = await apiCall;
      return response;
    } catch (e) {
      print('${e.toString()}');
      throw ServerError.withError(e);
    }
  }
}
