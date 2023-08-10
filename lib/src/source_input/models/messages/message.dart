import 'package:course_player/src/source_input/models/messages/bot/bot_message.dart';
import 'package:course_player/src/source_input/models/messages/bot/bot_quiz_message.dart';
import 'package:course_player/src/source_input/models/messages/user/user_answer_message.dart';
import 'package:course_player/src/source_input/models/messages/user/user_message.dart';

abstract class Message {
  final String text;

  const Message({required this.text});

  Message.fromJson(Map<String, dynamic> json) : text = json["text"];

  factory Message.jsonFactory(Map<String, dynamic> json) {
    if (json["source"] == "bot") {
      if (json["type"] == "quiz") {
        return BotQuizMessage.jsonFactory(json);
      }
      return BotMessage.fromJson(json);
    } else {
      return UserMessage.fromJson(json);
    }
  }
}
