import 'package:flutter/material.dart';

class CardType2Widget extends StatelessWidget {
  final String label;
  final double elevation;
  const CardType2Widget({
    super.key,
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(16),
        side: BorderSide(color: color.outline),
      ),
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
              child: Text('$label - outline'),
            ),
          ],
        ),
      ),
    );
  }
}
