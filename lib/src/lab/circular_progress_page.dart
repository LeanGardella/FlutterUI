import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {
  double progress = 0.0;
  double startProgress = 0.0;
  double endProgress = 0.0;

  AnimationController ctrl;

  @override
  void initState() {
    ctrl = new AnimationController(vsync: this, duration: Duration (milliseconds: 3000));

    ctrl.addListener(() { 

      setState(() {
        progress = lerpDouble(startProgress, endProgress, ctrl.value);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.orange[800],
        onPressed: () {
          startProgress = endProgress;
          endProgress += 50.0;
          if(endProgress > 100) {
            progress = 0.0;
            endProgress = 00.0;
            startProgress = 00.0;
          }

          ctrl.forward(from: 0.0);
          setState(() {});
        },
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(5.0),
              width: 300.0,
              height: 300.0,
              // color: Colors.red,
              child: CustomPaint(painter: _MiRadialProgress(progress))
            ),
          ),
          Center(
            child: Text(progress.toStringAsFixed(1) + ' %', style: TextStyle(color: Colors.orange[800], fontSize: 50.0 ),),
          ),
        ],
      ),
    );
  }
}

class _MiRadialProgress extends CustomPainter{
  final progress;

  _MiRadialProgress(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    

    // Circulo completo
    final paint = new Paint()
        ..strokeWidth = 4.0
        ..color       = Colors.grey
        ..style       = PaintingStyle.stroke;

    final center = Offset(size.width/2 , size.height/2);
    final radius = min(size.width/2, size.height/2);

    canvas.drawCircle(center, radius, paint);

    final paintArco = new Paint()
        ..strokeWidth = 10.0
        ..color       = Colors.orange[800]
        ..strokeCap   = StrokeCap.round
        ..style       = PaintingStyle.stroke;

    
    //Llenado
    double arcAngle = 2 * pi * ( progress / 100 );

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