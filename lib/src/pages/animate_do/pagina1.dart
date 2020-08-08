import 'package:disenos/src/pages/animate_do/navegacion_page.dart';
import 'package:disenos/src/pages/animate_do/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.twitter),
            onPressed: () {
              Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => TwitterPage()));
            },
          ),
          SlideInLeft(
            from: 30,
            child: IconButton(
              icon: FaIcon(Icons.navigate_next),
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => Pagina1Page()));
              },
            ),
          ),
        ],
        title: FadeIn(delay: Duration(milliseconds: 300), child: Text('Animate_do')),
      ),

      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.play),
          onPressed: (){
            Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => NavegacionPage()));
          },
        ),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElasticIn(delay: Duration(milliseconds: 1100), child: Icon(Icons.new_releases, color: Colors.blue, size: 50,)),
            FadeInDown(delay: Duration(milliseconds: 200), child: Text('Título', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),)),
            FadeInDown(delay: Duration(milliseconds: 800), child: Text('Soy un texto pequeño', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))),
            FadeInLeft(
              delay: Duration(milliseconds: 1100), 
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            ),
          ],
        )
     ),
   );
  }
}