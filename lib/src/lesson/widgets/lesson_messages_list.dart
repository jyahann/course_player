import 'package:course_player/src/lesson/bloc/lesson_bloc.dart';
import 'package:course_player/src/lesson/widgets/bot_message_widget.dart';
import 'package:course_player/src/lesson/widgets/user_message_widget.dart';
import 'package:course_player/src/source_input/models/messages/bot/bot_message.dart';
import 'package:course_player/src/source_input/models/messages/message.dart';
import 'package:course_player/src/source_input/models/messages/user/user_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonMessagesList extends StatelessWidget {
  const LessonMessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    return BlocConsumer<LessonBloc, LessonState>(
      listener: (context, state) {
        controller.animateTo(controller.position.maxScrollExtent,
            duration: const Duration(milliseconds: 1),
            curve: Curves.fastOutSlowIn);
      },
      listenWhen: (previous, current) =>
          previous.history.length != current.history.length,
      builder: (context, state) {
        List<Message> currentBotMessages = [];
        if (state.currentUserLessonMessages != null) {
          currentBotMessages = state.currentUserLessonMessages!.botMessages;
        }
        return Flexible(
          child: SingleChildScrollView(
            controller: controller,
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 15.0,
            ),
            physics: const BouncingScrollPhysics(),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: buildMessages(state.history + currentBotMessages),
              ),
            ),
          ),
        );
      },
    );
  }

  List<Widget> buildMessages(List<Message> messages) {
    return messages.map((e) {
      if (e is UserMessage) {
        return UserMessageWidget(
          userMessage: e,
        );
      } else {
        return BotMessageWidget(
          botMessage: e as BotMessage,
        );
      }
    }).toList();
  }
}
