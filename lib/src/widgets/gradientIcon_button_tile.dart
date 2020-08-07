import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class GradientIconTileButton extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color primaryColor;
  final Color secondaryColor;
  final Color textColor;
  final Function onPressed;

  const GradientIconTileButton({ 
    this.icon = Icons.new_releases,
    this.text = 'This is a new button!',
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.blueGrey,
    this.textColor = Colors.white,
    @required this.onPressed,
  }) ;


  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height;
    final maxWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: this.onPressed,
      child: Center(
        child: Stack(
          children: <Widget>[
            _ButtonBackground(
              maxHeight: maxHeight, 
              maxWidth: maxWidth, 
              icon: icon, 
              secondaryColor: secondaryColor, 
              primaryColor: primaryColor, 
              textColor: textColor,
              
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: maxHeight * 0.145, width: maxWidth * 0.1,),
                FaIcon(icon, size: maxWidth * 0.1, color: textColor),
                SizedBox( width: maxWidth * 0.05,),
                Expanded(child: Text(text, style: TextStyle(color: textColor, fontSize: maxWidth * 0.045),)),
                FaIcon(Icons.arrow_forward_ios, size: maxWidth * 0.075, color: textColor),
                SizedBox(width: maxWidth * 0.1,),
              ],
            ),
          ],

        ),
         
      ),
    );   
  }
}

class _ButtonBackground extends StatelessWidget {
  const _ButtonBackground({
    Key key,
    @required this.maxHeight,
    @required this.maxWidth, 
    @required this.primaryColor, 
    @required this.secondaryColor, 
    @required this.icon, 
    @required this.textColor,
  }) : super(key: key);

  final double maxHeight;
  final double maxWidth;
  final Color primaryColor;
  final Color secondaryColor;
  final IconData icon;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: maxHeight * 0.1,
      margin: EdgeInsets.all(maxWidth * 0.05),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(maxWidth * 0.035),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: maxWidth * 0.02, offset: Offset(4,6))],
        gradient: LinearGradient(
          colors: <Color>[
            primaryColor,
            secondaryColor,
            // Color(0xff6989f5),
            // Color(0xff906ef5),
           // Colors.purple,
          ]
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(maxWidth * 0.035),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -maxWidth * 0.05,
              top: -maxWidth * 0.06,
              child: FaIcon(icon, size: maxWidth * 0.363, color: textColor.withOpacity(0.2))
            )
          ],
        ),
      ),
    );
  }
}

