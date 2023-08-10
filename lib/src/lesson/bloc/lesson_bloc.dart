import 'package:bloc/bloc.dart';
import 'package:course_player/src/lesson/models/lesson_messages_model.dart';
import 'package:course_player/src/source_input/models/messages/bot/bot_quiz_message.dart';
import 'package:course_player/src/source_input/models/messages/message.dart';
import 'package:course_player/src/source_input/models/messages/user/user_answer_message.dart';
import 'package:meta/meta.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  LessonBloc(List<Message> messages)
      : super(
          LessonState(
            currentUserLessonMessages: LessonMessagesModel.fromMessagesFactory(
              messages,
            ),
          ),
        ) {
    on<LessonUserSendCurrentMessage>((event, emit) {
      if (state.currentUserLessonMessages != null &&
          state.currentUserLessonMessages!.userMessage != null) {
        emit(LessonState(
          currentUserLessonMessages:
              state.currentUserLessonMessages!.nextMessages,
          history: [
            ...state.history,
            ...state.currentUserLessonMessages!.botMessages,
            state.currentUserLessonMessages!.userMessage!,
          ],
        ));
      }
    });

    on<LessonUserQuizAnswer>(
      (event, emit) {
        final lessonMessages = state.currentUserLessonMessages;
        if (lessonMessages != null &&
            lessonMessages.botMessages.isNotEmpty &&
            lessonMessages.botMessages.last is BotQuizMessage) {
          final botQuizMessage =
              lessonMessages.botMessages.last as BotQuizMessage;
          if (botQuizMessage.answers.any(
            (answer) =>
                answer.text == event.userAnswer.text && answer.isCorrect,
          )) {
            emit(LessonState(
              currentUserLessonMessages:
                  state.currentUserLessonMessages!.nextMessages,
              history: [
                ...state.history,
                ...state.currentUserLessonMessages!.botMessages,
                event.userAnswer,
              ],
            ));
          }
        }
      },
    );
  }
}
