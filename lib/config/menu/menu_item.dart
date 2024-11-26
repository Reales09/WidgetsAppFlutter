import 'package:flutter/material.dart';

class MenuItem {
  final String tittle;
  final String subTittle;
  final String link;
  final IconData icon;

  const MenuItem({
    required this.tittle,
    required this.subTittle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItem>[
  MenuItem(
    tittle: 'Riverpod counte',
    subTittle: 'Introducción a RiverPod',
    link: '/counter',
    icon: Icons.add,
  ),
  MenuItem(
    tittle: 'Botones',
    subTittle: 'Varios',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItem(
    tittle: 'Tarjetas',
    subTittle: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItem(
    tittle: 'Progress Indicators',
    subTittle: 'Generales y controlados',
    link: '/progress',
    icon: Icons.refresh_rounded,
  ),
  MenuItem(
    tittle: 'Snackbars y dialogos',
    subTittle: 'Indicadores en pantalla',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  MenuItem(
    tittle: 'Animated container',
    subTittle: 'Stateful widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank_outlined,
  ),
  MenuItem(
    tittle: 'Charts',
    subTittle: 'Graficos',
    link: '/charts',
    icon: Icons.graphic_eq,
  ),
  MenuItem(
    tittle: 'Animaciones',
    subTittle: 'Lottie',
    link: '/lottie',
    icon: Icons.animation,
  ),
  MenuItem(
    tittle: 'Ui Controls + Tiles',
    subTittle: 'Una serie de controles de Flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined,
  ),
  MenuItem(
    tittle: 'Introducción a la aplicación',
    subTittle: 'Pequño tutorial introductorio',
    link: '/tutorial',
    icon: Icons.accessibility_rounded,
  ),
  MenuItem(
    tittle: 'infiniteScroll y Pull',
    subTittle: 'Listas infinitas y pull to request',
    link: '/infinite',
    icon: Icons.list_alt_rounded,
  ),
  MenuItem(
    tittle: 'Cambiar tema',
    subTittle: 'Cambiar tema de la aplicación',
    link: '/theme-changer',
    icon: Icons.color_lens_outlined,
  ),
];
