import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:street_art_witnesses/modules/moderation/edit_screen.dart';
import 'package:street_art_witnesses/modules/moderation/thanks_screen.dart';
import 'package:street_art_witnesses/modules/moderation/warning_screen.dart';
import 'package:street_art_witnesses/src/blocs/moderation/moderation_cubit.dart';
import 'package:street_art_witnesses/src/services/settings_service.dart';
import 'package:street_art_witnesses/widgets/other/app_error.dart';

class ModerationPage extends StatelessWidget {
  const ModerationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final showWarning = Get.find<SettingsService>().isShowing(ShowPages.moderationWarning);

    return BlocProvider(
      create: (_) => ModerationCubit(state: showWarning ? ModerationWarning() : ModerationEdit()),
      child: BlocConsumer<ModerationCubit, ModerationState>(
        listener: (context, state) {},
        buildWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
        builder: (context, state) {
          if (state is ModerationWarning) return const ModerationWarningScreen();
          if (state is ModerationEdit) return const ModerationEditScreen();
          if (state is ModerationThanks) return const ModerationThanksScreen();

          return const AppErrorScreen();
        },
      ),
    );
  }
}
