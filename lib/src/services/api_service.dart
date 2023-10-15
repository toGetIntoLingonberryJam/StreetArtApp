import 'package:dio/dio.dart';
import 'package:street_art_witnesses/src/models/user/authorized_user.dart';
import 'package:street_art_witnesses/src/models/user/user.dart';
import 'package:street_art_witnesses/src/utils/error_handler.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

abstract class ApiService {
  static final dio = Dio(
    BaseOptions(baseUrl: 'https://streetartback.onrender.com'),
  );

  static Future<T?> makeApiCall<T>(Function() apiCall) async {
    try {
      return await apiCall();
    } on DioException catch (e) {
      ErrorHandler.handleDioException(e);
    }
    return null;
  }

  static Future<User?> login({
    required String email,
    required String password,
  }) async {
    final response = await makeApiCall<Response>(() => dio.post(
          '/auth/login',
          data: {'username': email, 'password': password},
          options: Options(contentType: Headers.formUrlEncodedContentType),
        ));

    final String? token = response?.data['access_token'];
    if (token != null) {
      return AuthorizedUser(username: 'username', email: email, token: token);
    } else {
      ErrorHandler.handleUnknownError();
      return null;
    }
  }

  static Future<User?> register({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await makeApiCall<Response>(() => dio.post(
          '/auth/register',
          data: {'username': username, 'email': email, 'password': password},
        ));

    if (response != null) {
      Utils.showSnackBar(
          'Отлично, вы зарегистрированы! Теперь вы можете войти в свой аккаунт через форму входа');
    }
    return null;

    // final String? token = response?.data['access_token'];
    // if (token != null) {
    //   return AuthorizedUser(username: username, email: email, token: token);
    // } else {
    //   ErrorHandler.handleUnknownError();
    //   return null;
    // }
  }
}
