import 'package:street_art_witnesses/src/models/user/user.dart';

class AuthorizedUser extends User {
  AuthorizedUser({
    required String username,
    required String email,
    required String token,
  }) {
    _username = username;
    _email = email;
    _token = token;
  }

  late String _username;
  late String _email;
  // ignore: unused_field
  late String _token;

  @override
  String get username => _username;

  @override
  String? get email => _email;

  @override
  bool get isAuthorized => true;

  @override
  bool get isVerified => false;
}
