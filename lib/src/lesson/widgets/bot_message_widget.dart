import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:course_player/app_config/colors.dart';
import 'package:course_player/src/lesson/widgets/triangle_painter.dart';
import 'package:course_player/src/source_input/models/messages/bot/bot_message.dart';
import 'package:flutter/material.dart';

class BotMessageWidget extends StatelessWidget {
  final BotMessage botMessage;

  const BotMessageWidget({
    super.key,
    required this.botMessage,
  });

  @override
  Widget build(BuildContext context) {
    return FadedSlideAnimation(
      slideCurve: Curves.ease,
      slideDuration: const Duration(milliseconds: 300),
      beginOffset: const Offset(-1.0, 0),
      endOffset: const Offset(0, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox.square(
                dimension: 50.0, child: Image.asset("assets/bot.png")),
            const SizedBox(
              width: 8.0,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomPaint(
                  painter: TrianglePainter(
                    paintingStyle: PaintingStyle.fill,
                    strokeColor: appSpeachColor,
                  ),
                  child: const SizedBox(
                    width: 17,
                    height: 16,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: appSpeachColor,
                  ),
                  width: 280,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 20.0,
                  ),
                  child: Text(
                    botMessage.text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
