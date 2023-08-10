import 'package:course_player/src/source_input/models/messages/bot/bot_message.dart';
import 'package:course_player/src/source_input/models/messages/bot/bot_quiz_message.dart';
import 'package:course_player/src/source_input/models/messages/message.dart';
import 'package:course_player/src/source_input/models/messages/user/user_message.dart';

class LessonMessagesModel {
  final List<BotMessage> botMessages;
  final UserMessage? userMessage;
  final LessonMessagesModel? nextMessages;

  const LessonMessagesModel({
    this.userMessage,
    required this.botMessages,
    this.nextMessages,
  });

  factory LessonMessagesModel.fromMessagesFactory(List<Message> messages) {
    return _buildFromMessages(messages)!;
  }

  static LessonMessagesModel? _buildFromMessages(
    List<Message> messages, {
    int start = 0,
  }) {
    LessonMessagesModel? currentUserLessonMessages;
    List<BotMessage> botMessages = [];
    for (var i = start; i < messages.length; i++) {
      switch (messages[i].runtimeType) {
        case UserMessage:
          return LessonMessagesModel(
            userMessage: messages[i] as UserMessage,
            botMessages: botMessages,
            nextMessages: _buildFromMessages(messages, start: i + 1),
          );
        case BotQuizMessage:
          botMessages.add(messages[i] as BotQuizMessage);
          return LessonMessagesModel(
            botMessages: botMessages,
            nextMessages: _buildFromMessages(messages, start: i + 1),
          );
        case BotMessage:
          botMessages.add(messages[i] as BotMessage);
          if (i == messages.length - 1) {
            return LessonMessagesModel(botMessages: botMessages);
          }
      }
    }
    return currentUserLessonMessages;
  }
}
