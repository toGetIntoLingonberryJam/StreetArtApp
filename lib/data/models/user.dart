class User {
  final String _username;
  final String? _email;
  final String? _token;
  final bool _isAuthorized;
  final bool _isVerified;
  final bool _isArtist;
  final bool _isModerator;

  User({
    required String username,
    required String? email,
    required String? token,
    required bool isAuthorized,
    required bool isVerified,
    required bool isArtist,
    required bool isModerator,
  })  : _username = username,
        _email = email,
        _token = token,
        _isAuthorized = isAuthorized,
        _isVerified = isVerified,
        _isArtist = isArtist,
        _isModerator = isModerator;

  User.fromJson(Map<String, dynamic> json, {required String token})
      : _username = json['username'],
        _email = json['email'],
        _token = token,
        _isAuthorized = true,
        _isVerified = json['is_verified'] ?? false,
        _isArtist = json['is_artist'] ?? false,
        _isModerator = json['is_moderator'] ?? false;

  User.guest()
      : _username = 'Гость',
        _email = null,
        _token = null,
        _isAuthorized = false,
        _isVerified = false,
        _isArtist = false,
        _isModerator = false;

  String get username => _username;
  String? get email => _email;
  String? get token => _token;

  bool get isAuthorized => _isAuthorized;
  bool get isVerified => _isVerified;
  bool get isArtist => _isArtist;
  bool get isModerator => _isModerator;
}
