import 'package:street_art_witnesses/src/models/user/user.dart';

class GuestUser extends User {
  @override
  String get username => 'Гость';

  @override
  String? get email => null;

  @override
  bool get isAuthorized => false;

  @override
  bool get isVerified => false;
}
