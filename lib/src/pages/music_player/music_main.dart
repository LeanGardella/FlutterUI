import 'package:disenos/src/helpers/music-player-helper.dart';
import 'package:disenos/src/themes/music-player-theme.dart';
import 'package:disenos/src/themes/theme_changer.dart';
import 'package:disenos/src/widgets/music-player/custom-appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class MusicPlayerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeCtrl = Provider.of<ThemeChanger>(context);
    themeCtrl.currentTheme = miTema;
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          CustomAppbar(),
          _DiscoYDuracion(),
          _TituloYPlay(),
          Expanded(
            child: _Lyrics(),
          ),
        ],
      ),
   );
  }
}

class _Lyrics extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListWheelScrollView(
        physics: BouncingScrollPhysics(),
        itemExtent: 35,
        diameterRatio: 1.5,
        squeeze: 1.1,
        children: getLyrics().map((r) => Text(r, style: TextStyle(color: Colors.white54, fontSize: 20),)).toList(),
      ),
    );
  }
}

class _TituloYPlay extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      margin: EdgeInsets.only(top: 30),
      child: Row(
        children: <Widget>[
          SizedBox(width: 30,),
          Column(
            children: <Widget>[
              Text('500 Letters', style: TextStyle(fontSize: 28, color: Colors.white70, fontWeight: FontWeight.w500),),
              Text('Tarja Turunen', style: TextStyle(fontSize: 18, color: Colors.white54)),
            ],
          ),
          Spacer(),
          FloatingActionButton(
            backgroundColor: Colors.greenAccent[400],
            child: Icon(Icons.play_arrow),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _DiscoYDuracion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      margin: EdgeInsets.only(top: 70),
      child: Row(
        children: <Widget>[
          SizedBox(width: 15,),
          _Disco(),
          SizedBox(width: 40,),
          _Progreso(),
          SizedBox(width: 15,),

        ],
      ),
    );
  }
}

class _Progreso extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('4:50', style: TextStyle(color: Colors.white54)),
          SizedBox(height: 10,),
          Stack(
            children: <Widget>[
              Container(
                width: 3,
                height: 230,
                color: Colors.white38,
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: 3,
                  height: 120,
                  color: Colors.white70,
                ),
              ),

            ],
          ),
          SizedBox(height: 10,),
          Text('0:00', style: TextStyle(color: Colors.white54)),
        ],
      ),
    );
  }
}

class _Disco extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      padding: EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image(image: AssetImage('assets/music-player/cover.jpg'),),
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Color(0xff484750),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
            Container(
              height:18,
              width:18,
              decoration: BoxDecoration(
                color: Color(0xff1e1c24),
                borderRadius: BorderRadius.circular(100),
              ),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          colors: [
            Color(0xff484750),
            Color(0xff1e1c24),
          ]
        ),
      ),
    );
  }
}