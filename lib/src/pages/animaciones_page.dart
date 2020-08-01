import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget { 
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {
  
  AnimationController animCtrl;
  Animation<double> rotar;
  Animation<double> opacidad;
  Animation<double> opacidadOut;
  Animation<double> moverDerecha;
  Animation<double> agrandar;

  @override
  void initState() {
    animCtrl = new AnimationController(vsync: this, duration: Duration(milliseconds: 4000));
    
    rotar = Tween(begin: 0.0, end: 2 * math.pi).animate(CurvedAnimation(
      parent: animCtrl,
      curve: Curves.easeOut,
    ));

    opacidad = Tween(begin: 0.1 , end: 1.0).animate(CurvedAnimation(
      parent: animCtrl,
      curve: Interval(0, 0.5, curve: Curves.decelerate))
    );

    opacidadOut = Tween(begin: 1.0 , end: 0.0).animate(CurvedAnimation(
      parent: animCtrl,
      curve: Interval(0.6, 1.0, curve: Curves.easeIn))
    );

    moverDerecha = Tween(begin: 0.0 , end: 200.0 ).animate(CurvedAnimation(
      parent: animCtrl,
      curve: Curves.easeOut,
    ));

    agrandar = Tween(begin: 0.0 , end: 2.0 ).animate(CurvedAnimation(
      parent: animCtrl,
      curve: Curves.easeOut,
    ));

    animCtrl.addListener(() { 
      // print('Status: ${animCtrl.status}');
      if(animCtrl.status == AnimationStatus.completed)
        animCtrl.reverse();
      else if( animCtrl.status == AnimationStatus.dismissed )
        animCtrl.forward();
       
    });

    super.initState();
  }

  @override
  void dispose() {
    animCtrl.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    animCtrl.forward(); //Play
    return AnimatedBuilder(
      animation: animCtrl,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child) {
        // print (animCtrl.value);
        return Transform.translate(
          offset: Offset(moverDerecha.value,0),
          child: Transform.rotate(
          angle: rotar.value ,
          child: Opacity(
            opacity: opacidadOut.value,
            child: Opacity(
              opacity: opacidad.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: child
              ),
            ),
          ),
          ),
        );
      },
    ); 
  }
}

class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 100,
       height: 100,
       decoration: BoxDecoration(
         color: Colors.deepPurple
       ),
     );
   }
}