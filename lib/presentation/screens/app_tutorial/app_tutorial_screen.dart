import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String img;

  SlideInfo(this.title, this.caption, this.img);
}

List<SlideInfo> items = [
  SlideInfo(
      'Primer paso',
      'Consectetur id adipisicing consectetur proident qui eu adipisicing mollit veniam laboris. Qui sit tempor velit ut. Excepteur eiusmod do cupidatat esse adipisicing amet nisi et commodo magna adipisicing ea. Sit reprehenderit non quis aliquip sint ipsum ut incididunt dolor ullamco tempor sunt. Et dolor velit elit nostrud ut elit et cupidatat Lorem nostrud reprehenderit non magna commodo.',
      'assets/img/1.png'),
  SlideInfo(
      'Segundo paso',
      'Velit ullamco dolor irure nisi non laboris nostrud non. Eiusmod dolore magna enim labore dolore Lorem ut cillum esse ad aliquip aute. Tempor aliqua pariatur do mollit qui nisi. Fugiat culpa qui deserunt culpa ad.',
      'assets/img/2.png'),
  SlideInfo(
      'Ultimo paso',
      'Consequat in cupidatat fugiat labore laborum pariatur ea. Aliqua ut aliquip voluptate mollit sunt ullamco enim. Irure exercitation dolore ipsum esse aute.',
      'assets/img/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  PageController controller = PageController();
  bool endRead = false;
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      double page = controller.page ?? 0;

      if (!endRead && (page >= items.length - 1.5)) {
        setState(() {
          endRead = true;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              ...items
                  .map(
                    (slide) => _Slider(
                      title: slide.title,
                      caption: slide.caption,
                      img: slide.img,
                    ),
                  )
                  .toList(),
            ],
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: const Text('Salir'),
            ),
          ),
          if (endRead)
            Positioned(
              right: 20,
              bottom: 50,
              child: FadeInRight(
                duration: const Duration(milliseconds: 500),
                child: FilledButton(
                  onPressed: () => context.pop(),
                  child: const Text('Salir'),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _Slider extends StatelessWidget {
  final String title;
  final String caption;
  final String img;
  const _Slider({
    required this.title,
    required this.caption,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(img),
        const SizedBox(height: 20),
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 10),
        Text(
          caption,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
