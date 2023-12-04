import 'dart:async';

import 'package:flutter/material.dart';
import 'package:street_art_witnesses/src/services/user_service.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

class EmailCounterProvider with ChangeNotifier {
  EmailCounterProvider({required this.length});

  // When opening first time, send mail automatically
  static bool firstOpened = true;

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

  void sendEmail(BuildContext context, String token) {
    if (canSend) {
      _initCounting();
      UserService.verify(token: token);
      Utils.showMessage(context, 'Письмо успешно отправлено');
      notifyListeners();
    }
  }
}
