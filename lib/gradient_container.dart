import 'package:flutter/material.dart';
class GradientContainer extends StatelessWidget {
  GradientContainer({
    this.alignLeft,
    this.alignRight,
    this.colorStart = const Color.fromARGB(255, 53, 3, 118),
    this.colorEnd = const Color.fromARGB(255, 110, 7, 255),
    super.key});

  final dynamic alignLeft;
  final dynamic alignRight;
  final Color colorStart;
  final  Color colorEnd;

@override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorStart,
            colorEnd,
          ],
          begin: alignLeft,
          end: alignRight
        ),
      ),
    );
  }
}
