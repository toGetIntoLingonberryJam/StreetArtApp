import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/src/data/local_store_datasource.dart';
import 'package:street_art_witnesses/src/models/user.dart';
import 'package:street_art_witnesses/src/data/backend_api.dart';
import 'package:street_art_witnesses/src/providers/email_counter_provider.dart';
import 'package:street_art_witnesses/src/services/local_store_service.dart';
import 'package:street_art_witnesses/core/utils/logger.dart';

class AuthService extends GetxService {
  late final Rx<User> _user;
  Rx<User> get user => _user;

  Future<void> init() async {
    final token = await LocalStoreService.retrieveToken();
    final initUser = token == null ? User.guest() : await authenticate(token: token);
    _user = initUser.obs;
  }

  Future<void> updateUser() async {
    if (_user.value.token != null) _user.value = await authenticate(token: _user.value.token!);
    Logger.message('User updated');
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final response = await BackendApi.post(
      '/v1/auth/login',
      data: {'username': email, 'password': password},
      options: Options(contentType: Headers.formUrlEncodedContentType),
      requestType: RequestType.login,
    );

    if (response == null) {
      Logger.warning('Login failed');
      return false;
    }

    final String? token = response.data['access_token'];
    if (token != null) {
      await LocalStoreService.saveToken(token);
      _user.value = await authenticate(token: token);
      return true;
    } else {
      Logger.warning('No token returned');
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
      requestType: RequestType.register,
    );

    if (response == null) {
      Logger.warning('Registration failed');
      return false;
    } else {
      return await login(email: email, password: password);
    }
  }

  Future<User> authenticate({required String token}) async {
    final response = await BackendApi.get(
      '/v1/users/me',
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      requestType: RequestType.getUserViaToken,
    );

    if (response?.statusCode == 200 && response?.data != null) {
      final json = response!.data as Map<String, dynamic>;
      final user = User.fromJson(json, token: token);
      Logger.success('User auth successfull');
      return user;
    }
    Logger.warning('Get User via token failed');
    return User.guest();
  }

  Future<bool> verify({required String email}) async {
    final response = await BackendApi.post(
      '/v1/users/request-verify-token',
      requestType: RequestType.verify,
      data: {'email': email},
    );

    return response != null;
  }

  // TODO: Clear all user data: favourites, search history, tours, everyhting that depends on user
  Future<void> logout() async {
    await deleteUserLocalData();
    EmailCounterProvider.reset();
    _user.value = User.guest();
    Logger.message('[USER LOGGED OUT]');
  }

  Future<void> deleteUserLocalData() async {
    await LocalStoreDataSource.userDoc.delete();
    Logger.warning('Deleted user local data');
  }
}
