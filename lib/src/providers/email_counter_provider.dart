import 'dart:async';

import 'package:flutter/material.dart';
import 'package:street_art_witnesses/src/services/user_service.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

class EmailCounterProvider with ChangeNotifier {
  EmailCounterProvider({required this.length});

  // When opening first time, send mail automatically and show update button
  static bool firstOpened = true;
  static bool showUpdateButton = false;

  static void reset() {
    firstOpened = true;
    showUpdateButton = false;
  }

  final int length;
  StreamSubscription? subscription;

  bool get canSend => _count == 0;

  int _count = 0;
  int get count => _count;

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  void _tick() {
    _count -= 1;
    notifyListeners();
  }

  void _initCounting() {
    subscription?.cancel();
    subscription = Stream.periodic(const Duration(seconds: 1))
        .take(length)
        .listen((e) => _tick());
    _count = length;
  }

  Future<void> sendEmail(BuildContext context, String email) async {
    if (canSend) {
      _initCounting();
      firstOpened = false;
      showUpdateButton = true;
      final success = await UserService.verify(email: email);

      if (context.mounted) {
        if (success == true) {
          Utils.showMessage(context, 'Письмо успешно отправлено');
        } else if (success == false) {
          Utils.showMessage(context, 'Произошла ошибка при отправке письма');
        }
      }

      notifyListeners();
    }
  }
}
