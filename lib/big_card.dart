import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';


class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayLarge!.copyWith(color: Colors.black);

    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text( pair.asLowerCase,
        style: style),
        ),
      );
  }
}
