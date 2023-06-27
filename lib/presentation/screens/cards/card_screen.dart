import 'package:flutter/material.dart';
import 'package:widgets_app/presentation/widgets/widgets.dart';

final List<Map<String, dynamic>> cards = [
  {'elevation': 0.0, 'label': 'Elevated 0'},
  {'elevation': 1.0, 'label': 'Elevated 1'},
  {'elevation': 2.0, 'label': 'Elevated 2'},
  {'elevation': 3.0, 'label': 'Elevated 3'},
  {'elevation': 4.0, 'label': 'Elevated 4'},
  {'elevation': 5.0, 'label': 'Elevated 5'},
];

class CardScreen extends StatelessWidget {
  static const String name = 'card_screen';
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CARDS'),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards
              .map(
                (card) => _CardType1(
                  elevation: card['elevation'],
                  label: card['label'],
                ),
              )
              .toList(),
          ...cards
              .map(
                (card) => CardType2Widget(
                  elevation: card['elevation'],
                  label: card['label'],
                ),
              )
              .toList(),
          ...cards
              .map(
                (card) => CardType3Widget(
                  elevation: card['elevation'],
                  label: card['label'],
                ),
              )
              .toList(),
          ...cards
              .map(
                (card) => CardType4Widget(
                  elevation: card['elevation'],
                  label: card['label'],
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType1({
    required this.label,
    required this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
