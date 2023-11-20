import 'package:dio/dio.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork.dart';
import 'package:street_art_witnesses/src/models/artwork/artwork_location.dart';
import 'package:street_art_witnesses/src/models/author/author.dart';
import 'package:street_art_witnesses/src/models/user.dart';
import 'package:street_art_witnesses/src/services/storage_service.dart';
import 'package:street_art_witnesses/src/utils/debugging.dart';
import 'package:street_art_witnesses/src/utils/error_handler.dart';

abstract class ApiService {
  static final dio = Dio(
    BaseOptions(baseUrl: 'https://streetartback.onrender.com'),
  );

  static Future<T?> _makeApiCall<T>(Future<T> apiCall) async {
    Debug.log('Making API call...');
    try {
      final result = await apiCall;
      Debug.log('API returned data:\n${result.toString()}');
      return result;
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
      '/v1/auth/login',
      data: {'username': email, 'password': password},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    ));

    if (response == null) {
      return null;
    } else {
      final String? token = response.data['access_token'];
      if (token != null) {
        Debug.log('Saving token: $token');
        await StorageService.saveToken(token);

        return await getUserByToken(token: token);
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
      '/v1/auth/register',
      data: {'username': username, 'email': email, 'password': password},
    ));

    if (response != null) {
      return await login(email: email, password: password);
    }
    return null;
  }

  static Future<User> getUserByToken({required String token}) async {
    final response = await _makeApiCall<Response>(dio.get(
      '/v1/users/me',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    ));

    if (response?.statusCode == 200 && response?.data != null) {
      final json = response!.data as Map<String, dynamic>;

      return User.fromJson(json);
    }

    return User.guest();
  }

  static Future<List<ArtworkLocation>> getArtworkLocations() async {
    final response = await _makeApiCall<Response>(dio.get(
      '/v1/artworks/locations',
    ));

    List<ArtworkLocation> locations = [];

    if (response == null) {
      return [];
    } else {
      final List<dynamic> dataList = response.data;
      for (var locationData in dataList) {
        locations.add(ArtworkLocation.fromJson(locationData));
      }
    }

    return locations;
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
