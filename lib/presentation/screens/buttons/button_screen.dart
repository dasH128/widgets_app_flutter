import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/widgets/widgets.dart';

class ButtonScreen extends StatelessWidget {
  static const String name = 'button_screen';
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BUTTONS'),
      ),
      body: const _ButtonView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: const Icon(Icons.arrow_back_ios_outlined),
      ),
    );
  }
}

class _ButtonView extends StatelessWidget {
  const _ButtonView();

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('elevated button'),
            ),
            const ElevatedButton(
              onPressed: null,
              child: Text('elevated button'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.person),
              label: const Text('Elevated icon'),
            ),
            FilledButton(onPressed: () {}, child: const Text('filled')),
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.people),
              label: const Text('Filled icon'),
            ),
            OutlinedButton(onPressed: () {}, child: const Text('Outline')),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.star),
              label: const Text('outiled icon'),
            ),
            TextButton(onPressed: () {}, child: const Text('text')),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
              label: const Text('text icon'),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.alarm)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.alarm),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(color.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white),
              ),
            ),
            const Custom1ButtonWidget(),
          ],
        ),
      ),
    );
  }
}
