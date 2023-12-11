import 'package:dio/dio.dart';

abstract class CustomErrors {
  static CustomError parse(DioException e) {
    throw Exception('Method parse() is not implemented');
  }
}

abstract class CustomError {
  @override
  String toString();
}
