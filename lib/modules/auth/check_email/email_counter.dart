import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/core/values/colors.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/data/services/auth_service.dart';
import 'package:street_art_witnesses/modules/auth/check_email/controller.dart';
import 'package:street_art_witnesses/widgets/buttons/link_button.dart';

class EmailCounterWidget extends GetView<EmailCounterController> {
  const EmailCounterWidget({super.key});

  Future<void> _sendEmail(BuildContext context) async {
    await Utils.showLoading(controller.sendEmail(context, Get.find<AuthService>().user.value.email!));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmailCounterController>(
      builder: (counter) => Wrap(
        alignment: WrapAlignment.center,
        spacing: 10,
        children: [
          if (counter.canSend) _resendButton(context) else _resendText(context),
          Text('Через ${counter.count} сек', style: NewTextStyles.bodyRegular),
        ],
      ),
    );
  }

  Text _resendText(BuildContext context) {
    return Text(
      'Отправить повторно',
      style: NewTextStyles.bodyRegular.copyWith(color: UIColors.textSecondary),
    );
  }

  Widget _resendButton(BuildContext context) => LinkButton('Отправить повторно', onTap: () => _sendEmail(context));
}
