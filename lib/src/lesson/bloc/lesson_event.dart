part of 'lesson_bloc.dart';

@immutable
abstract class LessonEvent {
  const LessonEvent();
}

class LessonUserSendCurrentMessage extends LessonEvent {
  const LessonUserSendCurrentMessage();
}

class LessonUserQuizAnswer extends LessonEvent {
  final UserAnswerMessage userAnswer;

  const LessonUserQuizAnswer({required this.userAnswer});
}
