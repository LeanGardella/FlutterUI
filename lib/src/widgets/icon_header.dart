import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconGradientHeader extends StatelessWidget {

  final IconData icon;
  final String title;
  final String subtitle;
  final Color primaryColor;
  final Color secondaryColor;
  final Color textColor;

  const IconGradientHeader({
    @required this.icon, 
    @required this.title, 
    @required this.subtitle, 
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.blueGrey,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        _Background(h: h, color1: primaryColor, color2: secondaryColor,),
        Positioned(
          top: -h * 0.06,
          left: -h * 0.08,
          child: FaIcon(this.icon, color: textColor.withOpacity(0.3), size: h * 0.3),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: h * 0.09, width: double.infinity,),
            Text(this.subtitle, style: TextStyle(fontSize: h * 0.022, color: textColor.withOpacity(0.7)),),
            SizedBox(height: h * 0.025, width: double.infinity,),
            Text(this.title, style: TextStyle(fontSize: h * 0.03, color: textColor, fontWeight: FontWeight.bold),),
            SizedBox(height: h * 0.025, width: double.infinity,),
            FaIcon(this.icon, color: textColor, size: h * 0.08),
          ],
        ),
      ],
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({
    @required this.h, 
    @required this.color1, 
    @required this.color2,
  });

  final double h;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context,) {
    return Container(
      height: h * 0.33,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            // Color(0xff526bf6),
            // Color(0xff67acf2),
            color1, 
            color2,
          ]),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(h * 0.1)),
      ),
    );
  }
}