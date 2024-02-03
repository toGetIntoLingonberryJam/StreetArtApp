import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/src/data/local_store_datasource.dart';
import 'package:street_art_witnesses/src/models/user.dart';
import 'package:street_art_witnesses/src/data/backend_datasource.dart';
import 'package:street_art_witnesses/src/providers/email_counter_provider.dart';
import 'package:street_art_witnesses/src/services/local_store_service.dart';
import 'package:street_art_witnesses/core/utils/logger.dart';

class UserService extends GetxService {
  UserService({required User user}) : _user = user.obs;

  final Rx<User> _user;
  Rx<User> get user => _user;

  Future<void> updateUser() async {
    if (_user.value.token != null) _user.value = await authenticate(token: _user.value.token!);
    Logger.message('User updated');
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    final response = await BackendDataSource.post(
      '/v1/auth/login',
      data: {'username': email, 'password': password},
      options: Options(contentType: Headers.formUrlEncodedContentType),
      requestType: RequestType.login,
    );

    if (response == null) return Logger.warning('Login failed');

    final String? token = response.data['access_token'];
    if (token != null) {
      await LocalStoreService.saveToken(token);
      _user.value = await authenticate(token: token);
    } else {
      Logger.warning('No token returned');
    }
  }

  Future<void> register({
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
      Logger.warning('Registration failed');
    } else {
      login(email: email, password: password);
    }
  }

  Future<User> authenticate({required String token}) async {
    final response = await BackendDataSource.get(
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
    final response = await BackendDataSource.post(
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
