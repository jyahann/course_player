import 'package:course_player/src/source_input/models/messages/bot/bot_message.dart';
import 'package:course_player/src/source_input/models/messages/user/user_answer_message.dart';

class BotQuizMessage extends BotMessage {
  final List<UserAnswerMessage> answers;

  const BotQuizMessage({required super.text, required this.answers});

  factory BotQuizMessage.jsonFactory(Map<String, dynamic> json) {
    List<UserAnswerMessage> answers = [];
    for (var answerJson in json["answers"]) {
      answers.add(UserAnswerMessage.fromJson(answerJson));
    }
    return BotQuizMessage(text: json["text"], answers: answers);
  }
}
