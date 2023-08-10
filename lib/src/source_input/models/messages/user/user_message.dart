import 'package:course_player/src/source_input/models/messages/message.dart';

class UserMessage extends Message {
  const UserMessage({required super.text});

  UserMessage.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
