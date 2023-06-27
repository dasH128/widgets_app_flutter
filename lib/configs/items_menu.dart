import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.title,
    required this.subtitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Botones',
    subtitle: 'variso botones en flutter',
    link: '/buttons',
    icon: Icons.smart_button_rounded,
  ),
  MenuItem(
    title: 'Tarjetas',
    subtitle: 'Un contenedor estelizado en flutter',
    link: '/cards',
    icon: Icons.credit_card_rounded,
  ),
  MenuItem(
    title: 'Progres',
    subtitle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    title: 'Snackbar y diálogos',
    subtitle: 'Indicadores en pantalla',
    link: '/snackbars',
    icon: Icons.info_rounded,
  ),
  MenuItem(
    title: 'Contenedor animado',
    subtitle: 'Animación para widget en pantalla',
    link: '/animate',
    icon: Icons.animation_rounded,
  ),
  MenuItem(
    title: 'Ui Controles',
    subtitle: 'Widgets de control',
    link: '/controls',
    icon: Icons.format_underlined_rounded,
  ),
  MenuItem(
    title: 'Tutorial en apps',
    subtitle: 'Explicación de como usar la app',
    link: '/tutorial',
    icon: Icons.slideshow_rounded,
  ),
  MenuItem(
    title: 'Infiniti scroll',
    subtitle: 'Manejo de widget para scroll infinitos',
    link: '/scroll',
    icon: Icons.view_list_rounded,
  ),
  MenuItem(
    title: 'Contador RiverPod',
    subtitle: 'Manejo de estados con RIVERPOD',
    link: '/counter',
    icon: Icons.numbers,
  ),
  MenuItem(
    title: 'Thema del app',
    subtitle: 'Manejo del thema del aplicativo',
    link: '/theme',
    icon: Icons.theater_comedy,
  ),
];
