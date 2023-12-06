import 'package:dio/dio.dart';
import 'package:street_art_witnesses/src/data/local_store_datasource.dart';
import 'package:street_art_witnesses/src/models/user.dart';
import 'package:street_art_witnesses/src/data/backend_datasource.dart';
import 'package:street_art_witnesses/src/services/local_store_service.dart';
import 'package:street_art_witnesses/src/utils/custom_logger.dart';

abstract class UserService {
  static Future<User?> login({
    required String email,
    required String password,
  }) async {
    final response = await BackendDataSource.post(
      '/v1/auth/login',
      data: {'username': email, 'password': password},
      options: Options(contentType: Headers.formUrlEncodedContentType),
      requestType: RequestType.login,
    );

    if (response == null) {
      return null;
    } else {
      final String? token = response.data['access_token'];
      if (token != null) {
        await LocalStoreService.saveToken(token);

        return await getUserViaToken(token: token);
      } else {
        CustomLogger.showWarning('No token returned');
        return null;
      }
    }
  }

  static Future<User?> register({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await BackendDataSource.post(
      '/v1/auth/register',
      data: {'username': username, 'email': email, 'password': password},
      requestType: RequestType.register,
    );

    if (response == null) {
      return null;
    }
    return await login(email: email, password: password);
  }

  static Future<User> getUserViaToken({required String token}) async {
    final response = await BackendDataSource.get(
      '/v1/users/me',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      requestType: RequestType.getUserViaToken,
    );

    if (response?.statusCode == 200 && response?.data != null) {
      final json = response!.data as Map<String, dynamic>;
      return User.fromJson(json, token: token);
    }
    return User.guest();
  }

  static Future<bool> verify({required String email}) async {
    final response = await BackendDataSource.post(
      '/v1/users/request-verify-token',
      requestType: RequestType.verify,
      data: {'email': email},
    );

    if (response?.statusCode == 200 && response?.data != null) {
      return true;
    }
    return false;
  }

  static Future<void> deleteUserData() async {
    await LocalStoreDataSource.userDoc.delete();
    CustomLogger.showWarning('[USER DATA DELETED]');
  }
}
