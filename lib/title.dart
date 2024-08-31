import 'package:flutter/material.dart';

class TitleName extends StatelessWidget {
  const TitleName(
    this.welcomeMsg, 
    {super.key, 
    this.textColor = Colors.white,
    });

final String welcomeMsg;
final Color textColor;

@override
  Widget build(BuildContext context) {
return Center(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(welcomeMsg,
          style: TextStyle(color: textColor
          ),
          ),
        ),
      ],
    ),
);

  }
}
