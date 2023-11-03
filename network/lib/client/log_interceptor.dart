import 'dart:convert';

import 'package:dio/dio.dart';

/// Simple logging interceptor for dio.
class LoggingInterceptor extends Interceptor {
  LoggingInterceptor({
    this.compact = true,
  });

  /// Print compact json response
  final bool compact;

  final JsonDecoder decoder = const JsonDecoder();
  final JsonEncoder encoder = const JsonEncoder.withIndent('  ');

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    print('\n');
    print('<== Start Request ==>');
    print('Method: ${options.method}');
    print('Uri: ${options.uri}');
    print('<Headers>');
    options.headers.forEach((key, value) {
      print('$key: $value');
    });

    final data = options.data;
    if (data != null) {
      print('<Body>');
      if (data is Map) {
        if (compact) {
          print('$data');
        } else {
          _prettyPrintJson(data);
        }
      } else {
        print(data.toString());
      }
    }

    print('<== End Request ==>');
    return handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    print('\n');
    print('<== Start Response ==>');
    print('Uri: ${response.requestOptions.uri}');
    final statusMessage = response.statusMessage?.isNotEmpty == true
        ? 'Status Message: ${response.statusMessage}'
        : '';
    print('Status Code: ${response.statusCode} $statusMessage');
    final data = response.data;
    if (data != null) {
      print('<Body>');
      if (data is Map) {
        if (compact) {
          print('$data');
        } else {
          _prettyPrintJson(data);
        }
      } else {
        print(data.toString());
      }
    }

    print('<== End Response ==>');
    return handler.next(response);
  }

  @override
  void onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) {
    print('\n');
    print('<== Start Error ==>');
    print('Uri: ${err.response?.requestOptions.uri}');
    print('Error <-- HTTP FAILED: $err');
    if (err.response?.data != null &&
        err.response?.data is Map<String, dynamic>) {
      final body = err.response?.data as Map<String, dynamic>;
      print('$body');
    }
    print('<== End Error ==>');
    return handler.next(err);
  }

  void _prettyPrintJson(Object input) {
    final prettyString = encoder.convert(input);
    prettyString.split('\n').forEach((element) => print(element));
  }
}
