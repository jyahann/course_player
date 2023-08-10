import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:course_player/app_config/colors.dart';
import 'package:course_player/src/lesson/widgets/triangle_painter.dart';
import 'package:course_player/src/source_input/models/messages/user/user_message.dart';
import 'package:flutter/material.dart';

class UserMessageWidget extends StatelessWidget {
  final UserMessage userMessage;

  const UserMessageWidget({
    super.key,
    required this.userMessage,
  });

  @override
  Widget build(BuildContext context) {
    return FadedSlideAnimation(
      slideCurve: Curves.ease,
      slideDuration: const Duration(milliseconds: 300),
      beginOffset: const Offset(1.0, 0),
      endOffset: const Offset(0, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: userSpeachColor,
                  ),
                  width: 150,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 12.0,
                  ),
                  child: Text(
                    userMessage.text,
                    style: Theme.of(context).textTheme.bodyText1!,
                  ),
                ),
                CustomPaint(
                  painter: TrianglePainter(
                    isLeft: false,
                    paintingStyle: PaintingStyle.fill,
                    strokeColor: userSpeachColor,
                  ),
                  child: const SizedBox(
                    width: 17,
                    height: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 16.0,
            ),
            Image.asset("assets/user.png"),
          ],
        ),
      ),
    );
  }
}
