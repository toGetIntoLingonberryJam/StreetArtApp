import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/providers/email_counter_provider.dart';
import 'package:street_art_witnesses/src/providers/user_provider.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';

class EmailCounterWidget extends StatelessWidget {
  const EmailCounterWidget({super.key});

  Future<void> _sendEmail(BuildContext context) async {
    final user = context.read<UserProvider>().user;
    await Utils.of(context).showLoading(
      context.read<EmailCounterProvider>().sendEmail(context, user.email!),
    );
  }

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<EmailCounterProvider>();

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      children: [
        counter.canSend ? _resendButton(context) : _resendText(context),
        Text('Через ${counter.count} сек', style: TextStyles.text)
      ],
    );
  }

  Text _resendText(BuildContext context) {
    return Text(
      'Отправить повторно',
      style: TextStyles.text.copyWith(color: Theme.of(context).colorScheme.surface),
    );
  }

  Widget _resendButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _sendEmail(context),
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
