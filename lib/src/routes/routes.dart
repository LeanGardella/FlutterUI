import 'package:disenos/src/pages/music_player/music_main.dart';
import 'package:disenos/src/pages/shoes_app/shoes_desc.dart';
import 'package:disenos/src/pages/shoes_app/shoes_main.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:disenos/src/challenges/cuadrado_animado_page.dart';
import 'package:disenos/src/pages/slideshow_page.dart';
import 'package:disenos/src/pages/animate_do/pagina1.dart';
import 'package:disenos/src/pages/emergency_page.dart';
import 'package:disenos/src/pages/animaciones_page.dart';
import 'package:disenos/src/pages/graficas_circulares_page.dart';
import 'package:disenos/src/pages/headers_page.dart';
import 'package:disenos/src/pages/pinterest_page.dart';
import 'package:disenos/src/pages/sliver_list.dart';

final pageRoutes = <_Route>[
  _Route(FontAwesomeIcons.slideshare, 'SlideShow', SlideshowPage()),
  _Route(FontAwesomeIcons.ambulance, 'Emergencia', EmergencyPage()),
  _Route(FontAwesomeIcons.heading, 'Encabezados', HeadersPage()),
  _Route(FontAwesomeIcons.peopleCarry, 'Cuadro animado', CuadradoAnimadoPage()),
  _Route(FontAwesomeIcons.circleNotch, 'Circulo de progreso', GraficasCircularesPage()),
  _Route(FontAwesomeIcons.pinterest, 'Pinterest', PinterestPage()),
  _Route(FontAwesomeIcons.mobile, 'Slivers', SliverListPage()),
  _Route(FontAwesomeIcons.camera, 'Animation_do', Pagina1Page()),
  _Route(FontAwesomeIcons.cameraRetro, 'Animaciones', AnimationPage()),
  _Route(FontAwesomeIcons.shoePrints, 'ShoeApp', ShoesMainPage()),
  _Route(FontAwesomeIcons.music, 'Music Player', MusicPlayerPage())
];

class _Route {
  final IconData icon;
  final String  title;
  final Widget page;

  _Route(this.icon, this.title, this.page);
}