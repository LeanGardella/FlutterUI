import 'package:flutter/material.dart';
class BotonNaranja extends StatelessWidget {
  final String text;
  final double h;
  final double w;
  final Color color;

  const BotonNaranja({Key key, this.text, this.h, this.w, this.color = Colors.orange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      height: h,
      decoration: BoxDecoration(
        color: color ,
        borderRadius: BorderRadius.circular(100),
      ),
      alignment: Alignment.center,
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold),),
    );
  }
}