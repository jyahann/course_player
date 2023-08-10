import 'package:course_player/src/lesson/bloc/lesson_bloc.dart';
import 'package:course_player/src/lesson/widgets/lesson_messages_list.dart';
import 'package:course_player/src/lesson/widgets/user_message_buttons.dart';
import 'package:course_player/src/source_input/models/messages/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonScreen extends StatelessWidget {
  final List<Message> messages;

  const LessonScreen({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LessonBloc>(
      create: (context) => LessonBloc(messages),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            LessonMessagesList(),
            UserMessagesButtons(),
          ],
        ),
      ),
    );
  }
}
