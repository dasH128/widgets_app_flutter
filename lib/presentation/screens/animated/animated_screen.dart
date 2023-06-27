import 'dart:math' show Random;
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 100;
  double height = 100;
  double radius = 15;
  Color? color;

  void animateContainerRandom() {
    Random random = Random();
    var w = random.nextDouble() * 200 + 100;
    var h = random.nextDouble() * 200 + 100;
    var r = random.nextDouble() * 100 + 15;
    setState(() {
      width = w;
      height = h;
      radius = r;
      color = Color.fromRGBO(
        random.nextInt(254),
        random.nextInt(254),
        random.nextInt(254),
        1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Color colorPrimary = Theme.of(context).colorScheme.primary;
    return Scaffold(
      appBar: AppBar(title: const Text('ANIMATE')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => animateContainerRandom(),
        child: const Icon(Icons.play_arrow_rounded),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 450),
          curve: Curves.easeInCubic,
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: (color == null) ? colorPrimary : color,
          ),
        ),
      ),
    );
  }
}
