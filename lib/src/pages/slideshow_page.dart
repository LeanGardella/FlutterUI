import 'package:flutter/material.dart';
import 'package:disenos/src/widgets/slideshow.dart';
import 'package:flutter_svg/svg.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Expanded(child: MiSlides()),
        Expanded(child: MiSlides()),
      
      ],)
    );
  }
}

class MiSlides extends StatelessWidget {
  const MiSlides({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      // topButtons: true,
      primaryBullet: Colors.pink[300],
      secondaryBullet: Colors.grey[400],
      primarySize: 15.0,
      secondarySize: 10.0,
      slides: <Widget>[
        SvgPicture.asset('assets/svg/1.svg'),
        SvgPicture.asset('assets/svg/2.svg'),
        SvgPicture.asset('assets/svg/3.svg'),
        SvgPicture.asset('assets/svg/4.svg'),
        SvgPicture.asset('assets/svg/5.svg'),
        SvgPicture.asset('assets/svg/6.svg'),
      ],
    );
  }
}
