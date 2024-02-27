import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/api/local_store_datasource.dart';
import 'package:street_art_witnesses/data/models/user.dart';
import 'package:street_art_witnesses/data/services/local_store_service.dart';
import 'package:street_art_witnesses/core/utils/logger.dart';
import 'package:street_art_witnesses/modules/auth/check_email/controller.dart';

class AuthService extends GetxService {
  late final Rx<User> _user;
  Rx<User> get user => _user;

  Future<void> init() async {
    final token = await LocalStoreService.retrieveToken();
    final initUser = token == null ? User.guest() : await _authenticate(token: token);
    _user = initUser.obs;
  }

  Future<void> updateUser() async {
    if (_user.value.token != null) _user.value = await _authenticate(token: _user.value.token!);
    Logger.m('User updated');
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final response = await BackendApi.post(
      '/v1/auth/login',
      data: {'username': email, 'password': password},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );

    if (response == null) {
      Logger.w('Login failed');
      return false;
    }

    final String? token = response.data['access_token'];
    if (token != null) {
      await LocalStoreService.saveToken(token);
      _user.value = await _authenticate(token: token);
      return true;
    } else {
      Logger.w('No token returned');
      return false;
    }
  }

  Future<bool> register({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await BackendApi.post(
      '/v1/auth/register',
      data: {'username': username, 'email': email, 'password': password},
    );

    if (response == null) {
      Logger.w('Registration failed');
      return false;
    } else {
      return await login(email: email, password: password);
    }
  }

  Future<User> _authenticate({required String token}) async {
    final response = await BackendApi.get(
      '/v1/users/me',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );

    if (response?.statusCode == 200 && response?.data != null) {
      final json = response!.data as Map<String, dynamic>;
      final user = User.fromJson(json, token: token);
      Logger.s('User auth successfull');
      return user;
    }
    Logger.w('Get User via token failed');
    return User.guest();
  }

  Future<bool> verify({required String email}) async {
    final response = await BackendApi.post(
      '/v1/users/request-verify-token',
      data: {'email': email},
    );

    return response != null;
  }

  // TODO: Clear all user data: favourites, search history, tours, everyhting that depends on user
  Future<void> logout() async {
    await deleteUserLocalData();
    Get.find<EmailCounterController>().reset();
    _user.value = User.guest();
    Logger.m('[USER LOGGED OUT]');
  }

  Future<void> deleteUserLocalData() async {
    await LocalStoreDataSource.userDoc.delete();
    Logger.w('Deleted user local data');
  }
}
