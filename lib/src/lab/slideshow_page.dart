import 'package:disenos/src/models/slider_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) {  
          return new SliderModel();
        },
        child: Scaffold(
          body: Center(
          child: Column(
            children: <Widget>[
              Expanded(child: _Slides()),
              _Dots(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: mediaSize.height * 0.10,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _Dot(mediaSize: mediaSize, index: 0),
          _Dot(mediaSize: mediaSize, index: 1),
          _Dot(mediaSize: mediaSize, index: 2),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key key,
    @required this.mediaSize,
    this.index,
  });

  final Size mediaSize;
  final int index;

  @override
  Widget build(BuildContext context) {

    final curr = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      height: (index - 0.5 < curr && index + 0.5 > curr) ? mediaSize.width * 0.05 : mediaSize.width * 0.03,
      width: (index - 0.5 < curr && index + 0.5 > curr) ? mediaSize.width * 0.05 : mediaSize.width * 0.03,
      margin: EdgeInsets.symmetric(horizontal: mediaSize.width * 0.02,),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (index - 0.5 < curr && index + 0.5 > curr) ? Colors.pink : Colors.grey,
      ), 
      duration: Duration(milliseconds: 500),
    );
  }
}

class _Slides extends StatefulWidget {
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pvCtrl = new PageController();


  @override
  void initState() { 
    pvCtrl.addListener(() {
      Provider.of<SliderModel>(context, listen: false).currentPage = pvCtrl.page;
    });

    super.initState();
    
  }

  @override
  void dispose() {
    pvCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: pvCtrl,
        children: <Widget>[
          _Slide('assets/svg/1.svg'),
          _Slide('assets/svg/2.svg'),
          _Slide('assets/svg/3.svg'),
          
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String svg;
  const _Slide(this.svg);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30.0),
      child: SvgPicture.asset(svg)
    );
  }
}