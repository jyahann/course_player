import 'package:course_player/src/source_input/models/messages/message.dart';

class BotMessage extends Message {
  const BotMessage({required super.text});

  BotMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
