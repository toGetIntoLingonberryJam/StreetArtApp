import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:street_art_witnesses/pages/moderation/edit_screen.dart';
import 'package:street_art_witnesses/pages/moderation/thanks_screen.dart';
import 'package:street_art_witnesses/pages/moderation/warning_screen.dart';
import 'package:street_art_witnesses/src/blocs/moderation/moderation_cubit.dart';
import 'package:street_art_witnesses/widgets/other/app_error.dart';

class ModerationPage extends StatelessWidget {
  const ModerationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ModerationCubit(),
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
