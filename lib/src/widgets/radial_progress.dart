import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final progress;
  final showText;
  final duration;
  final primaryColor;
  final secondaryColor;
  final primaryStrokeWidth;
  final secondaryStrokeWidth;
  final fontSize;

  const RadialProgress( {
    @required this.progress, 
    this.showText = false, 
    @required this.duration ,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey, 
    this.primaryStrokeWidth = 10.0, 
    this.secondaryStrokeWidth = 4.0,
    this.fontSize = 20.0
    } ) ;

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> with SingleTickerProviderStateMixin{
  AnimationController ctrl;
  double currentProgress;
  double startProgress;
  double endProgress;

  @override
  void initState() {


    startProgress = 0.0;
    endProgress = 0.0;
    currentProgress = 0.0;

    ctrl = new AnimationController(vsync: this, duration: widget.duration);

    super.initState();
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ctrl.forward(from: 0.0);
    endProgress = widget.progress;
    final delta = endProgress - startProgress;
    startProgress = endProgress;

    // print('START: $startProgress');
    // print('END: $endProgress');
    // print('CURR: $currentProgress');
    
    return AnimatedBuilder(
      animation: ctrl, 
      builder: (BuildContext context, Widget child) {
        currentProgress = endProgress - delta + (delta * ctrl.value);
        //print('ANIM: $currentProgress');
        return Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              width: double.infinity,
              height: double.infinity,
              child:  CustomPaint(painter: _MiRadialProgress(
                    currentProgress, 
                    widget.primaryColor, 
                    widget.secondaryColor,
                    widget.primaryStrokeWidth,
                    widget.secondaryStrokeWidth
                    )),
            ),
            Center(
              child: (widget.showText) ? Text(currentProgress.toStringAsFixed(1) + ' %', style: TextStyle(color: widget.primaryColor, fontSize: widget.fontSize ),) : Container(),
            ),
          ],
        );
      }
    );
  }
}


class _MiRadialProgress extends CustomPainter{
  final progreso;
  final primaryColor;
  final secondaryColor;
  final primaryStrokeWidth;
  final secondaryStrokeWidth;

  _MiRadialProgress(this.progreso, this.primaryColor, this.secondaryColor, this.primaryStrokeWidth, this.secondaryStrokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    

    // Circulo completo
    final paint = new Paint()
        ..strokeWidth = secondaryStrokeWidth
        ..color       = secondaryColor
        ..style       = PaintingStyle.stroke;

    final center = Offset(size.width/2 , size.height/2);
    final radius = min(size.width/2, size.height/2);

    canvas.drawCircle(center, radius, paint);

    final paintArco = new Paint()
        ..strokeWidth = primaryStrokeWidth
        ..color       = primaryColor
        ..strokeCap   = StrokeCap.round
        ..style       = PaintingStyle.stroke;

    
    //Llenado
    double arcAngle = 2 * pi * ( progreso / 100 );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius), // Es el circulo que debe dibujar
      -pi/2, // angulo inicial
      arcAngle, // angulo final
      false, // si quiero que complete con el centro
      paintArco //lapiz
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate)  => true;

   
}