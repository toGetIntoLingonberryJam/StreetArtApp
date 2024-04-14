import 'package:street_art_ui_kit/street_art_ui_kit.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:street_art_witnesses/core/utils/logger.dart';
import 'package:street_art_witnesses/core/values/constants.dart';
import 'package:street_art_witnesses/data/models/artist/preview/artist_preview.dart';
import 'package:street_art_witnesses/modules/art/artwork/screen.dart';
import 'package:street_art_witnesses/core/utils/utils.dart';
import 'package:street_art_witnesses/core/utils/validator.dart';
import 'package:street_art_witnesses/modules/moderation/controller.dart';
import 'package:street_art_witnesses/modules/search/screen.dart';
import 'package:street_art_witnesses/widgets/map/location_picker.dart';

class ModerationEditScreen extends StatefulWidget {
  const ModerationEditScreen({super.key});

  @override
  State<ModerationEditScreen> createState() => _ModerationEditScreenState();
}

class _ModerationEditScreenState extends State<ModerationEditScreen> {
  late String title = _screens[0].title;
  final c = Get.put(ModerationController());

  void _moveToPage(int idx) => c.pageController.animateToPage(
        idx,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );

  late final _screens = <_ModerationEditView>[
    _MainInfoView(onTapNext: () => _moveToPage(1)),
    _AdditionalInfoView(onTapNext: () => _moveToPage(2)),
    _PreviewView(onTapNext: () => c.sendToModeration()),
  ];

  @override
  Widget build(BuildContext context) {
    return SAScaffold(
      title: title,
      body: PageView.builder(
        controller: c.pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (idx) => setState(() => title = _screens[idx].title),
        itemBuilder: (context, idx) => _screens[idx],
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
  final artistController = TextEditingController();
  final addressController = TextEditingController();
  final locationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LatLng? location;
  ArtistPreview? artist;

  @override
  void dispose() {
    nameController.dispose();
    artistController.dispose();
    addressController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void _save() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (context.mounted) {
        Get.find<ModerationController>().saveMainInfo(
          title: nameController.text.trim(),
          artist: artist!,
          address: addressController.text.trim(),
          location: location!,
        );
        widget.onTapNext();
      }
    }
  }

  void _showLocationPicker() async {
    final LatLng? loc = await Get.to(() => LocationPicker(
          initLocation: location ?? const LatLng(56.8519, 60.6122),
        ));
    if (loc != null) {
      location = loc;
      locationController.text =
          '${loc.latitude.toStringAsFixed(4)}, ${loc.longitude.toStringAsFixed(4)}';
    }
  }

  void _pickArtist() async {
    final ArtistPreview? pickedArtist = await Get.to(() => const SearchScreen());
    Logger.d('picked artist: ${pickedArtist?.name}');
    artist = pickedArtist;
    artistController.text = pickedArtist?.name ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: kPagePadding,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Фото', style: SATextStyles.headline1),
                      const SizedBox(height: 8),
                      const SAPrimaryButton(label: 'Выбрать фото', onTap: null),
                      const SizedBox(height: 40),
                      const Text('Название', style: SATextStyles.headline1),
                      const SizedBox(height: 8),
                      SATextFormField(
                        controller: nameController,
                        hintText: 'Введите название',
                        validator: Validator.get(Validate.notEmpty),
                      ),
                      const SizedBox(height: 16),
                      const Text('Автор', style: SATextStyles.headline1),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: _pickArtist,
                        child: SATextFormField(
                          enabled: false,
                          controller: artistController,
                          hintText: 'Укажите автора',
                          validator: Validator.get(Validate.notEmpty),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text('Адрес работы', style: SATextStyles.headline1),
                      const SizedBox(height: 8),
                      SATextFormField(
                        controller: addressController,
                        hintText: 'Введите адрес работы',
                        validator: Validator.get(Validate.notEmpty),
                      ),
                      const SizedBox(height: 16),
                      const Text('Местоположение', style: SATextStyles.headline1),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: _showLocationPicker,
                        child: SATextFormField(
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
              child: SAPrimaryButton(label: 'Далее', onTap: _save),
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
        final proceed = await Utils.showDialog(
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

      Get.find<ModerationController>().saveAdditionalInfo(
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
                      const Text('Год создания работы', style: SATextStyles.headline1),
                      const SizedBox(height: 8),
                      SATextFormField(
                        controller: yearController,
                        hintText: 'Введите год',
                        validator: Validator.get(Validate.year),
                      ),
                      const SizedBox(height: 16),
                      const Text('Фестиваль (при наличии)', style: SATextStyles.headline1),
                      const SizedBox(height: 8),
                      const SAPrimaryButton(label: 'Выбрать фестиваль', onTap: null),
                      const SizedBox(height: 40),
                      const Text('Описание работы', style: SATextStyles.headline1),
                      const SizedBox(height: 8),
                      SATextFormField(
                        controller: descriptionController,
                        hintText: 'Введите описание',
                        validator: null,
                      ),
                      const SizedBox(height: 16),
                      const Text('Интересные ссылки', style: SATextStyles.headline1),
                      const SizedBox(height: 8),
                      SATextFormField(
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
              child: SAPrimaryButton(
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
    final send = await Utils.showDialog(
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
    final c = Get.find<ModerationController>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ArtworkScreen.preview(artwork: c.preview),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: SAPrimaryButton(
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
