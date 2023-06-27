import 'package:go_router/go_router.dart';
import 'package:widgets_app/presentation/screens/screen.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/buttons',
    name: ButtonScreen.name,
    builder: (context, state) => const ButtonScreen(),
  ),
  GoRoute(
    path: '/cards',
    name: CardScreen.name,
    builder: (context, state) => const CardScreen(),
  ),
  GoRoute(
    path: '/progress',
    name: ProgressScreen.name,
    builder: (context, state) => const ProgressScreen(),
  ),
  GoRoute(
    path: '/snackbars',
    name: SnackbarScreen.name,
    builder: (context, state) => const SnackbarScreen(),
  ),
  GoRoute(
    path: '/animate',
    name: AnimatedScreen.name,
    builder: (context, state) => const AnimatedScreen(),
  ),
  GoRoute(
    path: '/controls',
    name: UiControlsScreen.name,
    builder: (context, state) => const UiControlsScreen(),
  ),
  GoRoute(
    path: '/tutorial',
    name: AppTutorialScreen.name,
    builder: (context, state) => const AppTutorialScreen(),
  ),
  GoRoute(
    path: '/scroll',
    name: InfiniteScrollScreen.name,
    builder: (context, state) => const InfiniteScrollScreen(),
  ),
  GoRoute(
    path: '/counter',
    name: CounterScreen.name,
    builder: (context, state) => const CounterScreen(),
  ),
  GoRoute(
    path: '/theme',
    name: ThemeChangerScreen.name,
    builder: (context, state) => const ThemeChangerScreen(),
  ),
]);
