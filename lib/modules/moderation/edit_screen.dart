import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/core/values/text_styles.dart';
import 'package:street_art_witnesses/modules/artwork/artwork_page.dart';
import 'package:street_art_witnesses/modules/user/controller.dart';
import 'package:street_art_witnesses/src/blocs/moderation/moderation_cubit.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/core/utils/validator.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/widgets/map/location_picker.dart';
import 'package:street_art_witnesses/widgets/other/app_appbar.dart';
import 'package:street_art_witnesses/widgets/other/app_text_form_field.dart';

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
    _PreviewView(
      onTapNext: () => context.read<ModerationCubit>().sendToModeration(
            context,
            token: Get.find<UserController>().user.value.token!,
          ),
    ),
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
}

class _MainInfoView extends StatefulWidget implements _ModerationEditView {
  const _MainInfoView({required this.onTapNext});

  final void Function() onTapNext;

  @override
  String get title => 'Основная информация';

  @override
  State<_MainInfoView> createState() => _MainInfoViewState();
}

class _MainInfoViewState extends State<_MainInfoView> {
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final locationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LatLng? location;

  @override
  void dispose() {
    nameController.dispose();
    addressController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void _save() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (context.mounted) {
        context.read<ModerationCubit>().saveMainInfo(
              title: nameController.text.trim(),
              address: addressController.text.trim(),
              location: location!,
            );
        widget.onTapNext();
      }
    }
  }

  void _showLocationPicker() async {
    final LatLng? loc = await Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => const LocationPicker(),
    ));
    if (loc != null) {
      location = loc;
      locationController.text =
          '${loc.latitude.toStringAsFixed(4)}, ${loc.longitude.toStringAsFixed(4)}';
    }
    _formKey.currentState?.validate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Фото', style: TextStyles.headline1),
                      const SizedBox(height: 8),
                      const AppButton.primary(label: 'Выбрать фото', onTap: null),
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
                      const AppButton.primary(label: 'Выбрать автора', onTap: null),
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
                      GestureDetector(
                        onTap: _showLocationPicker,
                        child: AppTextFormField(
                          enabled: false,
                          controller: locationController,
                          hintText: 'Укажите координаты работы',
                          validator: Validator.get(Validate.notEmpty),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: AppButton.primary(label: 'Далее', onTap: _save),
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
  State<_AdditionalInfoView> createState() => _AdditionalInfoViewState();
}

class _AdditionalInfoViewState extends State<_AdditionalInfoView> {
  final formKey = GlobalKey<FormState>();
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

  bool allSet() {
    return yearController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        linksController.text.isNotEmpty;
  }

  void save() async {
    if (formKey.currentState?.validate() ?? false) {
      if (!allSet()) {
        final proceed = await Utils.of(context).showWarning(
          title: 'Продолжить?',
          content: 'Вы не заполнили все дополнительные поля. Уверены, что хотите продолжить?',
          acceptText: 'Продолжить',
          declineText: 'Отмена',
        );
        if (proceed != true || !context.mounted) return;
      }
      final year = yearController.text.trim();
      final desciption = descriptionController.text.trim();
      final link = linksController.text.trim();

      context.read<ModerationCubit>().saveAdditionalInfo(
            year: year.isEmpty ? null : year,
            description: desciption.isEmpty ? null : desciption,
            link: link.isEmpty ? null : link,
          );
      widget.onTapNext();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Год создания работы', style: TextStyles.headline1),
                      const SizedBox(height: 8),
                      AppTextFormField(
                        controller: yearController,
                        hintText: 'Введите год',
                        validator: Validator.get(Validate.year),
                      ),
                      const SizedBox(height: 16),
                      const Text('Фестиваль (при наличии)', style: TextStyles.headline1),
                      const SizedBox(height: 8),
                      const AppButton.primary(label: 'Выбрать фестиваль', onTap: null),
                      const SizedBox(height: 40),
                      const Text('Описание работы', style: TextStyles.headline1),
                      const SizedBox(height: 8),
                      AppTextFormField(
                        controller: descriptionController,
                        hintText: 'Введите описание',
                        validator: null,
                      ),
                      const SizedBox(height: 16),
                      const Text('Интересные ссылки', style: TextStyles.headline1),
                      const SizedBox(height: 8),
                      AppTextFormField(
                        controller: linksController,
                        hintText: 'Введите ссылку',
                        validator: Validator.get(Validate.link),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: AppButton.primary(
                label: 'Перейти к проверке',
                onTap: save,
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

  void send0(BuildContext context) async {
    final send = await Utils.of(context).showWarning(
          title: 'Отправление на модерацию',
          content: 'Пожалуйста, убедитесь в правильности заполненных данных перед отправкой',
          acceptText: 'Отправить',
          declineText: 'Отмена',
        ) ??
        false;

    if (send && context.mounted) onTapNext();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ArtworkPage.preview(artwork: context.read<ModerationCubit>().preview),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: AppButton.primary(
                label: 'Отправить на модерацию',
                onTap: () => send0(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}