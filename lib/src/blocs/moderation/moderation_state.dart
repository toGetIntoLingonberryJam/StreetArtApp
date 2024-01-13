part of 'moderation_cubit.dart';

@immutable
sealed class ModerationState {}

final class ModerationWarning extends ModerationState {}

final class ModerationEdit extends ModerationState {}

final class ModerationPreview extends ModerationState {}

final class ModerationThanks extends ModerationState {}
