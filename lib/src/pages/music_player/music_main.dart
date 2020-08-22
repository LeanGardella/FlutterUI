import 'package:animate_do/animate_do.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:disenos/src/helpers/music-player-helper.dart';
import 'package:disenos/src/models/musicplayer_model.dart';
import 'package:disenos/src/themes/music-player-theme.dart';
import 'package:disenos/src/themes/theme_changer.dart';
import 'package:disenos/src/widgets/music-player/custom-appbar.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';


class MusicPlayerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeCtrl = Provider.of<ThemeChanger>(context);
    themeCtrl.currentTheme = miTema;
    return Scaffold(
      //backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff33333e),
                  Color(0xff201e28),
                ]
              ),
            ),
          ),
          Column(
            children: <Widget>[
              CustomAppbar(),
              _DiscoYDuracion(),
              _TituloYPlay(),
              Expanded(
                child: _Lyrics(),
              ),
            ],
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

class _TituloYPlay extends StatefulWidget {

  @override
  __TituloYPlayState createState() => __TituloYPlayState();
}

class __TituloYPlayState extends State<_TituloYPlay> with SingleTickerProviderStateMixin {

  bool isPlaying = false;
  bool isFirstTime = true;
  AnimationController animCtrl;

  final assetsAudioPlayer = new AssetsAudioPlayer();

  @override
  void initState() {
    animCtrl = new AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    animCtrl.dispose();
    super.dispose();
  }

  void open(){
    final prov = Provider.of<MusicplayerModel>(context, listen: false);
    assetsAudioPlayer.open(Audio('assets/music-player/500-letters.mp3'));

    assetsAudioPlayer.currentPosition.listen((d) { 
      
      prov.elapsedTime = d; 
    });
    assetsAudioPlayer.current.listen((d) { 
     // print(d.audio.duration);
      prov.songDuration = d.audio.duration; 
    });


  }

  @override
  Widget build(BuildContext context) {

    final prov = Provider.of<MusicplayerModel>(context, listen: false);
    
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
            child: AnimatedIcon(icon: AnimatedIcons.play_pause, progress: animCtrl,),
            onPressed: () {
              if(isPlaying){
                isPlaying = false;
                animCtrl.reverse();
                prov.animationController.stop();
              }else{
                isPlaying = true;
                animCtrl.forward();
                prov.animationController.repeat();
              }
               if(isFirstTime){
                  open();
                  isFirstTime = false;
                }else{
                  assetsAudioPlayer.playOrPause();
                }
            },

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
          SizedBox(width: 5,),
          _Disco(),
          SizedBox(width: 20,),
          _Progreso(),
          SizedBox(width: 5,),

        ],
      ),
    );
  }
}

class _Progreso extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MusicplayerModel>(context);
          
    //print('PROGRSO: ${prov.totalSongDuration}');
    return Container(
      child: Column(
        children: <Widget>[
          Text('${prov.totalSongDuration}', style: TextStyle(color: Colors.white54)),
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
                  height: 230 * prov.procentajeAvance,
                  color: Colors.white70,
                ),
              ),

            ],
          ),
          SizedBox(height: 10,),
          Text('${prov.elapsedTimeDuration}', style: TextStyle(color: Colors.white54)),
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
            SpinPerfect(
              duration: Duration(seconds: 10),
              infinite: true,
              animate: false,
              manualTrigger: true,
              controller: (c) => Provider.of<MusicplayerModel>(context).animationController = c ,
              child: Image(image: AssetImage('assets/music-player/cover.jpg'),)
              ),
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