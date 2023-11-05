import 'package:dio/dio.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_geopoint.dart';
import 'package:street_art_witnesses/src/models/author/author.dart';
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

      try {
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
      } catch (e) {
        print(e);
      }
    }

    return GuestUser();
  }

  static Future<List<ArtworkGeopoint>> getArtworkGeopoints() async {
    await Future.delayed(const Duration(seconds: 2));
    return mockArtworkGeopoints;
  }

  static Future<List<Author>> getAuthors() async {
    await Future.delayed(const Duration(seconds: 2));
    return mockAuthors;
  }

  static Future<List<Artwork>> getArtworks() async {
    await Future.delayed(const Duration(seconds: 2));
    return mockArtworks;
  }
}

const mockArtworkGeopoints = [
  ArtworkGeopoint(
    id: 1,
    latitude: 56.852554,
    longitude: 60.636610,
    address: 'Ул. Уральская, 74',
    previewUrl: null,
  ),
  ArtworkGeopoint(
    id: 2,
    latitude: 56.837827,
    longitude: 60.603358,
    address: 'Плотинка',
    previewUrl: null,
  ),
  ArtworkGeopoint(
    id: 3,
    latitude: 56.843856,
    longitude: 60.653828,
    address: 'ул. Мира, 19',
    previewUrl: null,
  ),
];

const mockAuthors = [
  Author(
    name: 'Покрас Лампас',
    thumbnailUrl: null,
  ),
  Author(
    name: 'Roma Bantik',
    thumbnailUrl: null,
  ),
  Author(
    name: 'Philippenzo',
    thumbnailUrl: null,
  ),
];

const mockArtworks = [
  Artwork(
    author: 'Roma Bantik',
    name: 'Мы станем лучше',
    address: 'Ул. Пушкина, 24',
    previewUrl: '',
  ),
  Artwork(
    author: 'Philippenzo',
    name: 'Лебединое озеро',
    address: 'Ул. Куйбышева, 121Б',
    previewUrl: '',
  ),
];
