import 'package:dio/dio.dart';

abstract class CustomErrors {
  static CustomError parse(DioException e) {
    if (e.response == null) {
      return CustomError.undefined();
    }
    return CustomError(e.response!);
  }
}

final class CustomError {
  CustomError(Response response) {
    final details = response.data['detail'] as Map<String, dynamic>;
    code = details['code'];
    message = details['message'];
    data = details['data'];
  }

  CustomError.undefined() {
    code = '';
    message = 'Произошла неизвестная ошибка :(';
    data = null;
  }

  late final String code;
  late final String message;
  late final Map<String, dynamic>? data;

  @override
  String toString() {
    return '$code: $message - $data';
  }
}
