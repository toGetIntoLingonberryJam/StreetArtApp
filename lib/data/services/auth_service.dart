import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:street_art_witnesses/core/utils/logger.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/data/api/backend_api.dart';
import 'package:street_art_witnesses/data/api/local_store_datasource.dart';
import 'package:street_art_witnesses/data/models/user.dart';
import 'package:street_art_witnesses/data/services/local_store_service.dart';
import 'package:street_art_witnesses/modules/auth/check_email/controller.dart';
import 'package:street_art_witnesses/modules/home/modules/collection/controller.dart';

class AuthService extends GetxService {
  late final Rx<User> _user;
  Rx<User> get user => _user;

  Future<void> init() async {
    final token = await LocalStoreService.retrieveToken();
    final initUser = token == null ? User.guest() : await _authenticate(token: token);
    _user = initUser.obs;

    // On user auth state updates
    user.listen((updatedUser) {
      Get.find<CollectionController>().loadAll();
    });
  }

  Future<void> updateUser() async {
    if (_user.value.token != null) _user.value = await _authenticate(token: _user.value.token!);
    Logger.d('user updated');
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    final token = await handleRequest(
      BackendApi.post(
        '/v1/auth/login',
        data: {'username': email, 'password': password},
        options: Options(contentType: Headers.formUrlEncodedContentType),
      ),
      onResult: (r) => r.data['access_token'] as String,
      onDioError: (e) {
        return e.response == null ? Utils.showError('Проблемы с интернет-соединением') : Utils.showError(e.response!.data);
      },
    );

    if (token == null) {
      Logger.w('login failed: no token returned');
      return false;
    }
    await LocalStoreService.saveToken(token);
    _user.value = await _authenticate(token: token);
    return true;
  }

  Future<bool> register({
    required String username,
    required String email,
    required String password,
  }) async {
    await handleRequest<Response>(
      BackendApi.post(
        '/v1/auth/register',
        data: {'username': username, 'email': email, 'password': password},
      ),
      onDioError: (e) => Logger.w('register failed'),
    );
    return await login(email: email, password: password);
  }

  Future<User> _authenticate({required String token}) async {
    final user = await handleRequest(
      BackendApi.get('/v1/users/me', options: Options(headers: {'Authorization': 'Bearer $token'})),
      onResult: (r) => User.fromJson(r.data, token: token),
    );
    if (user == null) {
      Logger.w('user authentication failed');
      return User.guest();
    }
    Logger.s('user auth successfull');
    return user;
  }

  Future<bool> verify({required String email}) async {
    final response = await handleRequest<Response>(
      BackendApi.post('/v1/users/request-verify-token', data: {'email': email}),
    );
    return response != null;
  }

  // TODO: Clear all user data: favourites, search history, tours, everyhting that depends on user
  Future<void> logout() async {
    await deleteUserLocalData();
    Get.find<EmailCounterController>().reset();
    _user.value = User.guest();
    Logger.d('user logged out');
  }

  Future<void> deleteUserLocalData() async {
    await LocalStoreDataSource.userDoc.delete();
    Logger.d('deleted user local data');
  }
}
