import 'package:course_player/src/source_input/models/messages/user/user_message.dart';

class UserAnswerMessage extends UserMessage {
  final bool isCorrect;

  const UserAnswerMessage({required super.text, required this.isCorrect});

  UserAnswerMessage.fromJson(
    Map<String, dynamic> json,
  )   : isCorrect = json.containsKey("correct") && json["correct"] == "true",
        super.fromJson(json);
}
