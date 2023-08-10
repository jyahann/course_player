import 'package:course_player/src/source_input/models/messages/message.dart';

class ResponseMessagesModel {
  final List<Message> messages;

  const ResponseMessagesModel({required this.messages});

  factory ResponseMessagesModel.jsonFactory(Map<String, dynamic> json) {
    List<Message> messages = [];
    for (var messageJson in json["messages"]) {
      messages.add(Message.jsonFactory(messageJson));
    }
    return ResponseMessagesModel(messages: messages);
  }
}
