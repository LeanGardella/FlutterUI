import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _CuadroAnimado(),)
    );
  }
}

class _CuadroAnimado extends StatefulWidget{
  @override
  __CuadroAnimadoState createState() => __CuadroAnimadoState();
}

class __CuadroAnimadoState extends State<_CuadroAnimado>  with SingleTickerProviderStateMixin{
  AnimationController ctrl;
  //Animaciones
  Animation<double> derecha;
  Animation<double> arriba;
  Animation<double> izquierda;
  Animation<double> abajo;

  @override
  void initState() { 
    ctrl = AnimationController(vsync: this, duration: Duration(milliseconds: 4500));
    derecha = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(curve: Interval(0.0, 0.25, curve: Curves.bounceOut), parent: ctrl));
    arriba = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(curve: Interval(0.25, 0.5, curve: Curves.bounceOut), parent: ctrl));
    izquierda = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(curve: Interval(0.5, 0.75, curve: Curves.bounceOut), parent: ctrl));
    abajo = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(curve: Interval(0.75, 1.0, curve: Curves.bounceOut), parent: ctrl));
    
    ctrl.addListener(() { 
      // print('Status: ${ctrl.status}');
      if(ctrl.status == AnimationStatus.completed)
        ctrl.reverse();
      else if( ctrl.status == AnimationStatus.dismissed )
        ctrl.forward();
       
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
   ctrl.forward();

    return AnimatedBuilder(
      animation: ctrl,
      child: _Rectangulo(),
      builder: (context, child) {
        // return Center(
        //   child: Transform.translate(
        //     offset: Offset(derecha.value,0),
        //     child: Transform.translate(
        //       offset: Offset(0, arriba.value),
        //       child: Transform.translate(
        //         offset: Offset(izquierda.value,0),
        //         child:  Transform.translate(
        //           offset: Offset(0, abajo.value),
        //           child: child
        //         ),
        //       ),
        //     ),
        //   ),
        // );
        return Center(
          child: Transform.translate(
            offset: Offset(derecha.value + izquierda.value, arriba.value + abajo.value),
            child: child,
          )
        );
      },
     
    );
  }
}

class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}