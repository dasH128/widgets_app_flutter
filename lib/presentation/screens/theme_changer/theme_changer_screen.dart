import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const String name = 'theme_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int colorSelectedIndex = ref.watch(colorSelectedProvider);
    final bool darkMode = ref.watch(darkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('THEMAS'),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(darkModeProvider.notifier).update((state) => !state);
            },
            icon: Icon(
              darkMode ? Icons.dark_mode_rounded : Icons.light_mode_rounded,
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (BuildContext context, int index) {
          final Color color = colors[index];
          return RadioListTile(
            title: Text(
              'Este color',
              style: TextStyle(color: color),
            ),
            subtitle: Text('${color.value}'),
            activeColor: color,
            value: index,
            groupValue: colorSelectedIndex,
            onChanged: (value) {
              ref
                  .read(colorSelectedProvider.notifier)
                  .update((state) => value!);
            },
          );
        },
      ),
    );
  }
}
