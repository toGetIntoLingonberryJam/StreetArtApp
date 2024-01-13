import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/blocs/moderation/moderation_cubit.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';
import 'package:street_art_witnesses/src/utils/validator.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/widgets/other/app_appbar.dart';
import 'package:street_art_witnesses/widgets/other/app_text_form_field.dart';
import 'package:street_art_witnesses/widgets/skeletons/app_placeholder.dart';

class ModerationEditScreen extends StatefulWidget {
  const ModerationEditScreen({super.key});

  @override
  State<ModerationEditScreen> createState() => _ModerationEditScreenState();
}

class _ModerationEditScreenState extends State<ModerationEditScreen> {
  final controller = PageController();
  late String title = _screens[0].title;

  void _moveToPage(int idx) => controller.animateToPage(
        idx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  late final _screens = <_ModerationEditView>[
    _MainInfoView(onTapNext: () => _moveToPage(1)),
    _AdditionalInfoView(onTapNext: () => _moveToPage(2)),
    _PreviewView(onTapNext: () => context.read<ModerationCubit>().showThanks()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: AppAppbar(
                title: title,
                leading: GestureDetector(
                  child: const Icon(Icons.arrow_back),
                  onTap: () => Navigator.pop(context),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: controller,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (idx) => setState(() => title = _screens[idx].title),
                itemBuilder: (context, idx) => _screens[idx],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

abstract class _ModerationEditView extends Widget {
  String get title;
  void save();
}

class _MainInfoView extends StatefulWidget implements _ModerationEditView {
  const _MainInfoView({required this.onTapNext});

  final void Function() onTapNext;

  @override
  String get title => 'Основная информация';

  @override
  void save() {}

  @override
  State<_MainInfoView> createState() => _MainInfoViewState();
}

class _MainInfoViewState extends State<_MainInfoView> {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Фото', style: TextStyles.headline1),
                    const SizedBox(height: 8),
                    AppButton.primary(label: 'Выбрать фото', onTap: () {}),
                    const SizedBox(height: 40),
                    const Text('Название', style: TextStyles.headline1),
                    const SizedBox(height: 8),
                    AppTextFormField(
                      controller: nameController,
                      hintText: 'Введите название',
                      validator: Validator.get(Validate.notEmpty),
                    ),
                    const SizedBox(height: 16),
                    const Text('Автор', style: TextStyles.headline1),
                    const SizedBox(height: 8),
                    AppButton.primary(label: 'Выбрать автора', onTap: () {}),
                    const SizedBox(height: 40),
                    const Text('Адрес работы', style: TextStyles.headline1),
                    const SizedBox(height: 8),
                    AppTextFormField(
                      controller: addressController,
                      hintText: 'Введите адрес работы',
                      validator: Validator.get(Validate.notEmpty),
                    ),
                    const SizedBox(height: 16),
                    const Text('Местоположение', style: TextStyles.headline1),
                    const SizedBox(height: 8),
                    AppButton.primary(label: 'Указать на карте', onTap: () {}),
                  ],
                ),
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) => Padding(
                padding: EdgeInsets.fromLTRB(20, constraints.maxHeight - 60, 20, 20),
                child: AppButton.primary(
                  label: 'Далее',
                  onTap: () {
                    widget.save();
                    if (_formKey.currentState?.validate() ?? false) widget.onTapNext();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdditionalInfoView extends StatefulWidget implements _ModerationEditView {
  const _AdditionalInfoView({required this.onTapNext});
  final void Function() onTapNext;

  @override
  String get title => 'Дополнительно';

  @override
  void save() {}

  @override
  State<_AdditionalInfoView> createState() => _AdditionalInfoViewState();
}

class _AdditionalInfoViewState extends State<_AdditionalInfoView> {
  final _formKey = GlobalKey<FormState>();
  final yearController = TextEditingController();
  final descriptionController = TextEditingController();
  final linksController = TextEditingController();

  @override
  void dispose() {
    yearController.dispose();
    descriptionController.dispose();
    linksController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Год создания работы', style: TextStyles.headline1),
                    const SizedBox(height: 8),
                    AppTextFormField(
                      controller: yearController,
                      hintText: 'Введите год',
                      validator: Validator.get(Validate.notEmpty),
                    ),
                    const SizedBox(height: 16),
                    const Text('Фестиваль (при наличии)', style: TextStyles.headline1),
                    const SizedBox(height: 8),
                    AppButton.primary(label: 'Выбрать фестиваль', onTap: () {}),
                    const SizedBox(height: 40),
                    const Text('Описание работы', style: TextStyles.headline1),
                    const SizedBox(height: 8),
                    AppTextFormField(
                      controller: descriptionController,
                      hintText: 'Введите описание',
                      validator: Validator.get(Validate.notEmpty),
                    ),
                    const SizedBox(height: 16),
                    const Text('Интересные ссылки', style: TextStyles.headline1),
                    const SizedBox(height: 8),
                    AppTextFormField(
                      controller: linksController,
                      hintText: 'Введите ссылки',
                      validator: Validator.get(Validate.notEmpty),
                    ),
                  ],
                ),
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) => Padding(
                padding: EdgeInsets.fromLTRB(20, constraints.maxHeight - 60, 20, 20),
                child: AppButton.primary(
                  label: 'Перейти к проверке',
                  onTap: () {
                    widget.save();
                    if (_formKey.currentState?.validate() ?? false) widget.onTapNext();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PreviewView extends StatelessWidget implements _ModerationEditView {
  const _PreviewView({required this.onTapNext});

  final void Function() onTapNext;

  @override
  String get title => 'Предпросмотр';

  @override
  void save() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(kContainerRadius),
                    child: const AppPlaceholder(height: 400),
                  ),
                  const SizedBox(height: 16),
                  const AppContainer(child: SizedBox(height: 40)),
                  const SizedBox(height: 16),
                  const AppContainer(child: SizedBox(height: 20)),
                  const SizedBox(height: 16),
                  const AppContainer(child: SizedBox(height: 140)),
                  const SizedBox(height: 16),
                  const AppContainer(child: SizedBox(height: 30)),
                ],
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) => Padding(
                padding: EdgeInsets.fromLTRB(20, constraints.maxHeight - 60, 20, 20),
                child: AppButton.primary(
                  label: 'Отправить на модерацию',
                  onTap: () async {
                    save();

                    final send = await Utils.of(context).showWarning(
                          title: 'Отправление на модерацию',
                          content:
                              'Пожалуйста, убедитесь в правильности заполненных данных перед отправкой',
                          acceptText: 'Отправить',
                          declineText: 'Отмена',
                        ) ??
                        false;

                    if (send && context.mounted) {
                      await Utils.of(context).showLoading(
                        Future.delayed(const Duration(seconds: 1)),
                      );
                      onTapNext();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
