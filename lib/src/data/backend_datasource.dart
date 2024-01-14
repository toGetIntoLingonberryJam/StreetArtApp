import 'package:dio/dio.dart';
import 'package:street_art_witnesses/src/utils/logger.dart';

abstract class BackendDataSource {
  static final _dio = Dio(
    BaseOptions(baseUrl: 'https://streetartwitnesses.fvds.ru'),
  );

  static Future<Response?> _makeApiRequest(
    Future<Response> request, {
    required RequestType requestType,
    required String url,
  }) async {
    Logger.apiCall(url);
    try {
      final result = await request;
      Logger.apiResult(url, result.toString());
      return result;
    } on DioException catch (e) {
      Logger.dioError(e, requestType);
      return null;
    }
  }

  static Future<Response?> get(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    required RequestType requestType,
  }) async {
    return await _makeApiRequest(
      _dio.get(
        url,
        data: data,
        options: options,
        queryParameters: queryParameters,
      ),
      requestType: requestType,
      url: url,
    );
  }

  static Future<Response?> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    required RequestType requestType,
  }) async {
    return await _makeApiRequest(
      _dio.post(
        url,
        data: data,
        options: options,
        queryParameters: queryParameters,
      ),
      requestType: requestType,
      url: url,
    );
  }

  static Future<Response?> patch(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    required RequestType requestType,
  }) async {
    return await _makeApiRequest(
      _dio.patch(
        url,
        data: data,
        options: options,
        queryParameters: queryParameters,
      ),
      requestType: requestType,
      url: url,
    );
  }

  static Future<Response?> delete(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    required RequestType requestType,
  }) async {
    return await _makeApiRequest(
      _dio.delete(
        url,
        data: data,
        options: options,
        queryParameters: queryParameters,
      ),
      requestType: requestType,
      url: url,
    );
  }
}
