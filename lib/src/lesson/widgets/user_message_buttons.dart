import 'package:course_player/src/lesson/bloc/lesson_bloc.dart';
import 'package:course_player/src/lesson/widgets/user_message_button.dart';
import 'package:course_player/src/source_input/models/messages/bot/bot_quiz_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserMessagesButtons extends StatelessWidget {
  const UserMessagesButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBloc, LessonState>(
      builder: (context, state) {
        if (state.currentUserLessonMessages == null) {
          return const SizedBox.shrink();
        }
        final currentMessages = state.currentUserLessonMessages!;
        List<UserMessageButton> messages = [];
        if (currentMessages.userMessage != null) {
          messages.add(
            UserMessageButton(
              userMessage: currentMessages.userMessage!,
            ),
          );
        } else if (currentMessages.botMessages.last is BotQuizMessage) {
          final quizMessage =
              currentMessages.botMessages.last as BotQuizMessage;
          messages = quizMessage.answers
              .map<UserMessageButton>(
                (e) => UserMessageButton(userMessage: e),
              )
              .toList();
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: messages,
          ),
        );
      },
    );
  }
}
