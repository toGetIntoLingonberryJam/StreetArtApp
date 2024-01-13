import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/blocs/moderation/moderation_cubit.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/widgets/other/app_appbar.dart';
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

class _MainInfoView extends StatelessWidget implements _ModerationEditView {
  const _MainInfoView({required this.onTapNext});

  final void Function() onTapNext;

  @override
  String get title => 'Основная информация';

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
            const SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                children: [
                  AppContainer(child: SizedBox(height: 40)),
                  SizedBox(height: 16),
                  AppContainer(child: SizedBox(height: 20)),
                  SizedBox(height: 16),
                  AppContainer(child: SizedBox(height: 140)),
                  SizedBox(height: 16),
                  AppContainer(child: SizedBox(height: 30)),
                  SizedBox(height: 16),
                  AppContainer(child: SizedBox(height: 80)),
                  SizedBox(height: 16),
                  AppContainer(child: SizedBox(height: 20)),
                  SizedBox(height: 16),
                  AppContainer(child: SizedBox(height: 140)),
                  SizedBox(height: 16),
                  AppContainer(child: SizedBox(height: 30)),
                  SizedBox(height: 16),
                  AppContainer(child: SizedBox(height: 80)),
                ],
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) => Padding(
                padding: EdgeInsets.fromLTRB(20, constraints.maxHeight - 60, 20, 20),
                child: AppButton.primary(
                  text: 'Далее',
                  onTap: () => {save(), onTapNext()},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdditionalInfoView extends StatelessWidget implements _ModerationEditView {
  const _AdditionalInfoView({required this.onTapNext});

  final void Function() onTapNext;

  @override
  String get title => 'Дополнительно';

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
            const SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                children: [
                  AppContainer(child: SizedBox(height: 40)),
                  SizedBox(height: 16),
                  AppContainer(child: SizedBox(height: 20)),
                  SizedBox(height: 16),
                  AppContainer(child: SizedBox(height: 140)),
                  SizedBox(height: 16),
                  AppContainer(child: SizedBox(height: 30)),
                ],
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) => Padding(
                padding: EdgeInsets.fromLTRB(20, constraints.maxHeight - 60, 20, 20),
                child: AppButton.primary(
                  text: 'Перейти к проверке',
                  onTap: () => {save(), onTapNext()},
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
                  text: 'Отправить на модерацию',
                  onTap: () async {
                    save();
                    await Utils.of(context).showLoading(
                      Future.delayed(const Duration(seconds: 1)),
                    );
                    onTapNext();
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
