import 'package:dio/dio.dart';
import 'package:street_art_witnesses/src/models/user/authorized_user.dart';
import 'package:street_art_witnesses/src/models/user/guest_user.dart';
import 'package:street_art_witnesses/src/models/user/user.dart';
import 'package:street_art_witnesses/src/models/user/verified_user.dart';
import 'package:street_art_witnesses/src/services/storage_service.dart';
import 'package:street_art_witnesses/src/utils/error_handler.dart';

abstract class ApiService {
  static final dio = Dio(
    BaseOptions(baseUrl: 'https://streetartback.onrender.com'),
  );

  static Future<T?> _makeApiCall<T>(Future<T> apiCall) async {
    try {
      return await apiCall;
    } on DioException catch (e) {
      ErrorHandler.handleDioException(e);
      return null;
    }
  }

  static Future<User?> login({
    required String email,
    required String password,
  }) async {
    final response = await _makeApiCall<Response>(dio.post(
      '/auth/login',
      data: {'username': email, 'password': password},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    ));

    if (response == null) {
      return null;
    } else {
      final String? token = response.data['access_token'];
      if (token != null) {
        print('Saving token: $token');
        await StorageService.saveToken(token);
        return AuthorizedUser(username: 'username', email: email, token: token);
      } else {
        ErrorHandler.handleUnknownError();
        return null;
      }
    }
  }

  static Future<User?> register({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await _makeApiCall<Response>(dio.post(
      '/auth/register',
      data: {'username': username, 'email': email, 'password': password},
    ));

    if (response != null) {
      return await login(email: email, password: password);
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

  static Future<User> getUserByToken({required String token}) async {
    final response = await _makeApiCall<Response>(dio.get(
      '/user/me',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    ));

    if (response?.statusCode == 200 && response?.data != null) {
      final data = response!.data;

      if (data['is_verified']) {
        return VerifiedUser(
          username: data['username'],
          email: data['email'],
          token: token,
        );
      } else {
        return AuthorizedUser(
          username: data['username'],
          email: data['email'],
          token: token,
        );
      }
    }
    return GuestUser();
  }
}
