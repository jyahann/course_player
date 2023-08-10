import 'package:course_player/app_config/colors.dart';
import 'package:course_player/src/lesson/bloc/lesson_bloc.dart';
import 'package:course_player/src/source_input/models/messages/user/user_answer_message.dart';
import 'package:course_player/src/source_input/models/messages/user/user_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserMessageButton extends StatefulWidget {
  final UserMessage userMessage;

  const UserMessageButton({super.key, required this.userMessage});

  @override
  State<UserMessageButton> createState() => _UserMessageButtonState();
}

class _UserMessageButtonState extends State<UserMessageButton> {
  bool isIncorrect = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () {
            if (widget.userMessage is UserAnswerMessage) {
              final answer = widget.userMessage as UserAnswerMessage;
              if (answer.isCorrect) {
                BlocProvider.of<LessonBloc>(context).add(
                  LessonUserQuizAnswer(userAnswer: answer),
                );
              } else {
                setState(() {
                  isIncorrect = true;
                });
              }
            } else {
              BlocProvider.of<LessonBloc>(context).add(
                const LessonUserSendCurrentMessage(),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: isIncorrect ? errorColor : primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  10,
                ),
              ),
            ),
          ),
          child: Text(
            widget.userMessage.text,
            style: Theme.of(context).textTheme.button,
          ),
        ),
      ),
    );
  }
}
