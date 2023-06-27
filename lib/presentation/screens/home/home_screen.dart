import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/configs/items_menu.dart';
import 'package:widgets_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Flutter + M3'),
      ),
      drawer: MenuDrawerWidget(scaffoldKey: scaffoldKey),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    const List<MenuItem> items = appMenuItems;
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) =>
          _CustomListTile(menu: items[index]),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menu,
  });

  final MenuItem menu;

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menu.icon, color: color.primary),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: color.inversePrimary,
      ),
      title: Text(menu.title),
      subtitle: Text(menu.subtitle),
      onTap: () {
        context.push(menu.link);
      },
    );
  }
}
