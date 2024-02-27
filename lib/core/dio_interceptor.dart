import 'package:dio/dio.dart';
import 'package:street_art_witnesses/core/utils/logger.dart';

final class LoggerDioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Logger.apiCall(options.baseUrl);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger.apiResult(response.realUri.toString(), response.data);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    Logger.dioException(err, where: err.stackTrace.toString());
    super.onError(err, handler);
  }
}
