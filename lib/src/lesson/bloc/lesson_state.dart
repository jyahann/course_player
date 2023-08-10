part of 'lesson_bloc.dart';

@immutable
class LessonState {
  final List<Message> history;
  final LessonMessagesModel? currentUserLessonMessages;

  const LessonState({
    this.history = const [],
    this.currentUserLessonMessages,
  });
}
