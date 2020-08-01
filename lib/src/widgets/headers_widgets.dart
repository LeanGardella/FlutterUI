import 'package:flutter/material.dart';

class SquaredHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff5a27c1),
    );
  }
}

class RoundBorderHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff5a27c1),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight:  Radius.circular(50) ),
      ),
    );
  }
}

class ObliqueHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff5a27c1),
      child: CustomPaint(
        painter: _ObliquePainter(), 
      ),
    );
  }

}

class _ObliquePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pen = Paint();

    // Propiedades
    pen.color = Color(0xff5a27c1);
    pen.style = PaintingStyle.fill;
    pen.strokeWidth = 1.0;

    final path = Path();
    
    // Dibujar con el path y el lápiz
    path.lineTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, pen);

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class DiagonalHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff5a27c1),
      child: CustomPaint(
        painter: _DiagonalPainter(), 
      ),
    );
  }

}

class _DiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pen = Paint();

    // Propiedades
    pen.color = Color(0xff5a27c1);
    pen.style = PaintingStyle.fill;
    pen.strokeWidth = 1.0;

    final path = Path();
    
    // Dibujar con el path y el lápiz
    path.lineTo(size.width, size.height );
    // path.lineTo(0, size.height);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pen);

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}


class PicoHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff5a27c1),
      child: CustomPaint(
        painter: _PicoPainter(), 
      ),
    );
  }

}

class _PicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pen = Paint();

    // Propiedades
    pen.color = Color(0xff5a27c1);
    pen.style = PaintingStyle.fill;
    pen.strokeWidth = 1.0;

    final path = Path();
    
    // Dibujar con el path y el lápiz
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pen);

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}


class WaveHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff5a27c1),
      child: CustomPaint(
        painter: _WavePainter(), 
      ),
    );
  }

}

class _WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pen = Paint();

    // Propiedades
    pen.color = Color(0xff5a27c1);
    pen.style = PaintingStyle.fill;
    pen.strokeWidth = 1.0;

    final path = Path();
    
    // Dibujar con el path y el lápiz
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30,size.width/2, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20,size.width, size.height * 0.25);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pen);

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class CurvedHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff5a27c1),
      child: CustomPaint(
        painter: _CurvedPainter(), 
      ),
    );
  }

}

class _CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final pen = Paint();

    // Propiedades
    pen.color = Color(0xff5a27c1);
    pen.style = PaintingStyle.fill;
    pen.strokeWidth = 1.0;

    final path = Path();
    
    // Dibujar con el path y el lápiz
    path.lineTo(0, size.height * 0.20);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.40,size.width, size.height * 0.20);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pen);

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}


class InvertedWaveHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      //color: Color(0xff5a27c1),
      child: CustomPaint(
        painter: _InvertedWavePainter(), 
      ),
    );
  }

}

class _InvertedWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(
      center: Offset(110.0, 1.0),
      radius: 300
    );

    final Gradient gradient = new LinearGradient(colors: 
    <Color>[
      Color(0xff5a27c1),
      Color(0xff2F157A),
      Color(0xff18157A),
      Color(0xff15347A),
    ]);
    
    final pen = Paint()..shader = gradient.createShader(rect);

    // Propiedades

    pen.style = PaintingStyle.fill;
    pen.strokeWidth = 20.0;

    final path = Path();
    
    // Dibujar con el path y el lápiz
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(size.width /4, size.height*0.8, size.width/2, size.height * 0.75);
    path.quadraticBezierTo(size.width*0.75, size.height*0.7, size.width, size.height * 0.75);
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, pen);

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}