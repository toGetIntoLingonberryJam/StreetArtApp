enum Validate { notEmpty, email, password, login, year, link }

typedef ValidateFunction = String? Function(String?)?;

abstract class Validator {
  static ValidateFunction get(Validate validate) {
    switch (validate) {
      case Validate.login:
        return _validateLogin;
      case Validate.email:
        return _validateEmail;
      case Validate.password:
        return _validatePassword;
      case Validate.notEmpty:
        return _validateNotEmpty;
      case Validate.year:
        return _validateYear;
      case Validate.link:
        return _validateLink;
    }
  }

  static String? _validateLogin(String? login) {
    if (login == null || login.isEmpty) {
      return 'Введите логин';
    }
    return null;
  }

  static String? _validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Введите почту';
    }
    return null;
  }

  static String? _validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Введите пароль';
    }
    return null;
  }

  static String? _validateNotEmpty(String? field) {
    if (field == null || field.isEmpty) {
      return 'Это поле не может быть пустым';
    }
    return null;
  }

  static String? _validateLink(String? string) {
    if (string == null || string.isEmpty) return null;
    final isValid = Uri.tryParse(string)?.isAbsolute;
    if (isValid != true) {
      return 'Укажите правильную ссылку';
    }
    return null;
  }

  static String? _validateYear(String? string) {
    if (string == null || string.isEmpty) return null;
    // if (string == null || string.isEmpty) {
    //   return 'Введите год';
    // }
    final year = int.tryParse(string);
    if (year == null) {
      return 'Введите число';
    }
    if (year < 1900) {
      return 'Введите год после 1900';
    }
    if (year > DateTime.now().year) {
      return 'Этот год еще не наступил';
    }
    return null;
  }
}
