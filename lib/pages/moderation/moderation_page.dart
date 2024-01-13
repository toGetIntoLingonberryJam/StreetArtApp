import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:street_art_witnesses/constants.dart';
import 'package:street_art_witnesses/src/blocs/moderation/moderation_cubit.dart';
import 'package:street_art_witnesses/src/utils/utils.dart';
import 'package:street_art_witnesses/widgets/buttons/app_button.dart';
import 'package:street_art_witnesses/widgets/buttons/app_custom_button.dart';
import 'package:street_art_witnesses/widgets/containers/app_container.dart';
import 'package:street_art_witnesses/widgets/other/app_appbar.dart';
import 'package:street_art_witnesses/widgets/other/app_error.dart';
import 'package:street_art_witnesses/widgets/skeletons/app_placeholder.dart';

part 'warning_screen.dart';
part 'edit_screen.dart';
part 'thanks_screen.dart';
part 'preview_screen.dart';

class ModerationPage extends StatelessWidget {
  const ModerationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ModerationCubit(),
      child: const _ModerationScreen(),
    );
  }
}

class _ModerationScreen extends StatelessWidget {
  const _ModerationScreen();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ModerationCubit, ModerationState>(
      listener: (context, state) {},
      buildWhen: (prev, curr) => prev.runtimeType != curr.runtimeType,
      builder: (context, state) {
        if (state is ModerationWarning) return const _WarningScreen();
        if (state is ModerationEdit) return const _EditScreen();
        if (state is ModerationThanks) return const _ThanksScreen();

        return const AppErrorScreen();
      },
    );
  }
}
