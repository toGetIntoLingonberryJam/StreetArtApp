enum Validate { notEmpty, email, password, login }

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
}
