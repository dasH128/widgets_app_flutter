import 'package:flutter/material.dart';

class CardType4Widget extends StatelessWidget {
  final String label;
  final double elevation;
  const CardType4Widget({
    super.key,
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elevation.toInt()}/600/350',
            height: 350,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(16)),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
