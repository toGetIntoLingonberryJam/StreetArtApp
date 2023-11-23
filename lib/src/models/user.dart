class User {
  final String _username;
  final String? _email;
  final bool _isAuthorized;
  final bool _isVerified;
  final bool _isArtist;
  final bool _isModerator;

  User({
    required String username,
    required String? email,
    required bool isAuthorized,
    required bool isVerified,
    required bool isArtist,
    required bool isModerator,
  })  : _username = username,
        _email = email,
        _isAuthorized = isAuthorized,
        _isVerified = isVerified,
        _isArtist = isArtist,
        _isModerator = isModerator;

  User.fromJson(Map<String, dynamic> json)
      : _username = json['username'],
        _email = json['email'],
        _isAuthorized = true,
        _isVerified = json['is_verified'] ?? false,
        _isArtist = json['is_artist'] ?? false,
        _isModerator = json['is_moderator'] ?? false;

  User.guest()
      : _username = 'Гость',
        _email = null,
        _isAuthorized = false,
        _isVerified = false,
        _isArtist = false,
        _isModerator = false;

  String get username => _username;
  String? get email => _email;

  bool get isAuthorized => _isAuthorized;
  bool get isVerified => _isVerified;
  bool get isArtist => _isArtist;
  bool get isModerator => _isModerator;
}
