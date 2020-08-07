import 'package:animate_do/animate_do.dart';
import 'package:disenos/src/widgets/gradientIcon_button_tile.dart';
import 'package:disenos/src/widgets/icon_header.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}


class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    final items = <ItemBoton>[
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    ];

    final List<Widget> botones = items.map((e) => FadeInLeft(
          child: GradientIconTileButton(
        onPressed: (){},
        primaryColor: e.color1,
        secondaryColor: e.color2,
        icon: e.icon,
        text: e.texto,
      ),
    )).toList();

    return Scaffold(
      body: Stack(
        children: <Widget>[

          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: botones,
            ),
          ),
          Stack(
            children: <Widget>[
              IconGradientHeader(
                icon: FontAwesomeIcons.plus, 
                subtitle: 'Haz solicitado', 
                title: 'Asistencia Médica',
                primaryColor: Color(0xff536CF6),
                secondaryColor: Color(0xff66A9F2),
              ),
              Positioned(
                right: 0,
                top: MediaQuery.of(context).size.height * 0.05,
                child: RawMaterialButton(
                  onPressed: () {},
                  padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
                  shape: CircleBorder(),
                  child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
   );
  }
}

// class _BotonTemp extends StatelessWidget {
//   const _BotonTemp({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Stack(
//         children: <Widget>[
//           // _PageHeader(),
//           GradientIconTileButton(
//             icon: FontAwesomeIcons.carCrash,
//             text: 'Asistencia Mecánica',
//             primaryColor: Color(0xff6989f5),
//             secondaryColor: Color(0xff906ef5),
//             textColor: Colors.white,
//             onPressed: () {print('click');},
//           ),
//         ],
//       ),
//      );
//   }
// }

class _PageHeader extends StatelessWidget {
  const _PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconGradientHeader(
      icon: FontAwesomeIcons.plus,
      title: 'Asistencia Médica',
      subtitle: 'Haz solicitado',
      primaryColor: Color(0xff526bf6),
      secondaryColor: Color(0xff67acf2),
      textColor: Colors.white,
    );
  }
}