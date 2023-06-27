import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/configs/items_menu.dart';

class MenuDrawerWidget extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const MenuDrawerWidget({
    super.key,
    required this.scaffoldKey,
  });

  @override
  State<MenuDrawerWidget> createState() => _MenuDrawerWidgetState();
}

class _MenuDrawerWidgetState extends State<MenuDrawerWidget> {
  int _navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    // EdgeInsets viewPadding = MediaQuery.of(context).viewPadding;
    return NavigationDrawer(
      onDestinationSelected: (index) {
        setState(() {
          _navDrawerIndex = index;
        });

        var menu = appMenuItems[index];
        context.push(menu.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      selectedIndex: _navDrawerIndex,
      elevation: 0,
      children: [
        ...appMenuItems
            .sublist(0, 3)
            .map((menu) => NavigationDrawerDestination(
                  icon: Icon(menu.icon),
                  label: Text(menu.title),
                  selectedIcon: const Icon(Icons.check_rounded),
                ))
            .toList(),
        const Padding(
          padding: EdgeInsets.fromLTRB(18, 10, 18, 10),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 18, 10),
          child: Text('Más opciones'),
        ),
        ...appMenuItems
            .sublist(3)
            .map((menu) => NavigationDrawerDestination(
                  icon: Icon(menu.icon),
                  label: Text(menu.title),
                  selectedIcon: const Icon(Icons.check_rounded),
                ))
            .toList(),
      ],
    );
  }
}
