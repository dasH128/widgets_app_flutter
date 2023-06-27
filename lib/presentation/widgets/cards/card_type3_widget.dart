import 'package:flutter/material.dart';

class CardType3Widget extends StatelessWidget {
  final String label;
  final double elevation;
  const CardType3Widget({
    super.key,
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    return Card(
      color: color.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings_rounded),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('$label - filed'),
            ),
          ],
        ),
      ),
    );
  }
}
