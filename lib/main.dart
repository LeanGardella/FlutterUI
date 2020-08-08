// import 'package:disenos/src/challenges/cuadrado_animado_page.dart';
// import 'package:disenos/src/pages/animaciones_page.dart';
// import 'package:disenos/src/lab/circular_progress_page.dart';
// import 'package:disenos/src/pages/graficas_circulares_page.dart';
// import 'package:disenos/src/lab/slideshow_page.dart';
// import 'package:disenos/src/pages/slideshow_page.dart';
// import 'package:disenos/src/pages/headers_page.dart';
// import 'package:disenos/src/pages/pinterest_page.dart';
// import 'package:disenos/src/pages/emergency_page.dart';
// import 'package:disenos/src/pages/sliver_list.dart';
// import 'package:disenos/src/pages/animate_do/twitter_page.dart';
//import 'package:disenos/src/pages/animate_do/navegacion_page.dart';
import 'package:flutter/material.dart';
import 'package:disenos/src/pages/animate_do/pagina1.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UI App',
      home: Pagina1Page(),
    );
  }
}