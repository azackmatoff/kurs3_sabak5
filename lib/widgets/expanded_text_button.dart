import 'package:flutter/material.dart';

class ExpandedTextButton extends StatelessWidget {
  final Color buttonBgColor;
  final String buttonText;
  final Function onPressed;

  const ExpandedTextButton({
    Key key,
    this.buttonBgColor,
    this.buttonText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
            ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              buttonBgColor,
            ),
          ),
        ),
      ),
    );
  }
}
