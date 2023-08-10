import 'package:course_player/app_config/colors.dart';
import 'package:flutter/material.dart';

enum PrimaryButtonState { active, disabled, loading }

class PrimaryButton extends StatelessWidget {
  final String title;
  final PrimaryButtonState state;
  final EdgeInsetsGeometry padding;
  final Function onPressed;

  const PrimaryButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.state = PrimaryButtonState.active,
    this.padding = const EdgeInsets.symmetric(
      vertical: 20.0,
      horizontal: 20.0,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (state == PrimaryButtonState.active) {
          onPressed();
        }
      },
      style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: state == PrimaryButtonState.active
              ? primaryColor
              : Colors.transparent,
          padding: padding,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                10,
              ),
            ),
          )),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.button,
          ),
          if (state == PrimaryButtonState.loading)
            Container(
              padding: const EdgeInsets.only(left: 10.0),
              child: const SizedBox.square(
                dimension: 18.0,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
