import 'package:flutter/material.dart';

class ButtonRandom extends StatelessWidget {
ButtonRandom(this.textString, {super.key, this.textColor = Colors.white});

final String textString;
final Color textColor;

  @override
  Widget build(BuildContext context) {
  return Text(textString,
  style: TextStyle(color: textColor),
  );
  }
}
