import 'package:street_art_witnesses/src/models/user/user.dart';

class VerifiedUser extends User {
  VerifiedUser({
    required String username,
    required String email,
  }) {
    _username = username;
    _email = email;
  }

  late String _username;
  late String _email;

  @override
  String get username => _username;

  @override
  String? get email => _email;

  @override
  bool get isAuthorized => true;

  @override
  bool get isVerified => true;
}
