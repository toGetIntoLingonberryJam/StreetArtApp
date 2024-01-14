part of 'moderation_cubit.dart';

@immutable
sealed class ModerationState {}

final class ModerationWarning extends ModerationState {}

final class ModerationEdit extends ModerationState {}

final class ModerationThanks extends ModerationState {}

final class ModerationError extends ModerationState {}
