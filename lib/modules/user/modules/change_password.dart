import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SAScaffold(
      title: 'Изменить пароль',
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Пароль', style: SATextStyles.headline1),
            SizedBox(height: 10),
            _ChangePasswordForm(),
          ],
        ),
      ),
    );
  }
}

class _ChangePasswordForm extends StatefulWidget {
  const _ChangePasswordForm();

  @override
  State<_ChangePasswordForm> createState() => __ChangePasswordFormState();
}

class __ChangePasswordFormState extends State<_ChangePasswordForm> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        const SAContainer.small(
          child: Text('Введите старый пароль', style: SATextStyles.text),
        ),
        const SizedBox(height: 10),
        const SAContainer.small(
          child: Text('Введите новый пароль', style: SATextStyles.text),
        ),
        const SizedBox(height: 10),
        const SAContainer.small(
          child: Text('Повторите новый пароль', style: SATextStyles.text),
        ),
        const SizedBox(height: 40),
        SAPrimaryButton(
          onTap: () => Utils.showSuccess('Изменения сохранены'),
          label: 'Сохранить',
        ),
      ],
    ));
  }
}
