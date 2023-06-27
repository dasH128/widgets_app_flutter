import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/configs/app_router.dart';
import 'package:widgets_app/configs/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(
    const ProviderScope(child: MainApp()),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(darkModeProvider);
    final int colorSelected = ref.watch(colorSelectedProvider);
    return MaterialApp.router(
      title: 'Widget M3',
      routerConfig: appRouter,
      theme: AppTheme(
        selectedColor: colorSelected,
        isDarkMode: isDarkMode,
      ).getTheme(),
      debugShowCheckedModeBanner: false,
      // home: const HomeScreen(),
    );
  }
}
