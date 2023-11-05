class User {
  final String _username;
  final String? _email;
  final bool _isAuthorized;
  final bool _isVerified;

  User({
    required String username,
    required String? email,
    required bool isAuthorized,
    required bool isVerified,
  })  : _username = username,
        _email = email,
        _isAuthorized = isAuthorized,
        _isVerified = isVerified;

  User.fromJson(Map<String, dynamic> json)
      : _username = json['username'],
        _email = json['email'],
        _isAuthorized = true,
        _isVerified = json['is_verified'] ?? false;

  User.guest()
      : _username = 'Гость',
        _email = null,
        _isAuthorized = false,
        _isVerified = false;

  String get username => _username;
  String? get email => _email;

  bool get isAuthorized => _isAuthorized;
  bool get isVerified => _isVerified;
}
