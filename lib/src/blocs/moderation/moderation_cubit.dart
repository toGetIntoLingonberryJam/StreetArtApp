import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

part 'moderation_state.dart';

class ModerationCubit extends Cubit<ModerationState> {
  ModerationCubit() : super(ModerationWarning());

  void showEdit() => emit(ModerationEdit());
  void showThanks() => emit(ModerationThanks());
}
