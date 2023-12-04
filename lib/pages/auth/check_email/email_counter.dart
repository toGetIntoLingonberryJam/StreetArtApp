import 'dart:async';

import 'package:flutter/material.dart';
import 'package:street_art_witnesses/constants.dart';

class EmailCounter extends StatefulWidget {
  const EmailCounter({super.key, required this.startCount});

  final int startCount;

  @override
  State<EmailCounter> createState() => _EmailCounterState();
}

class _EmailCounterState extends State<EmailCounter> {
  late int count = 0;
  StreamSubscription? subscription;
  bool canSend = false;

  @override
  void initState() {
    super.initState();
    _reset();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  void _reset() {
    // TODO: Send email

    setState(() {
      canSend = false;
      count = widget.startCount;
      subscription = Stream.periodic(const Duration(seconds: 1))
          .take(widget.startCount)
          .listen((event) => updateTimer());
    });
  }

  void updateTimer() {
    setState(() {
      count -= 1;
      print('count = $count');
      if (count == 0) {
        canSend = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      children: [
        canSend ? _resendButton() : _resendText(),
        Text('Через $count сек', style: TextStyles.text)
      ],
    );
  }

  Text _resendText() {
    return Text(
      'Отправить повторно',
      style: TextStyles.text
          .copyWith(color: Theme.of(context).colorScheme.surface),
    );
  }

  Widget _resendButton() {
    return GestureDetector(
      onTap: () => _reset(),
      child: Text(
        'Отправить повторно',
        style: TextStyles.text.copyWith(
          color: Theme.of(context).colorScheme.inverseSurface,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
