import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {

  final List<Widget> slides;
  final bool topButtons;
  final Color primaryBullet;
  final Color secondaryBullet;
  final double primarySize;
  final double secondarySize;

  const Slideshow({
    @required this.slides,
    this.topButtons = false,
    this.primaryBullet = Colors.blue,
    this.secondaryBullet = Colors.grey,
    this.primarySize = 10.0,
    this.secondarySize = 10.0,
  });


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {  
          return new _SliderModel();
        },
      child: SafeArea(
          child: Center(
            child: Builder(
              builder: (BuildContext context) { 
                Provider.of<_SliderModel>(context)._primary = primaryBullet;
                Provider.of<_SliderModel>(context)._secondary = secondaryBullet;
                Provider.of<_SliderModel>(context)._primarySize = primarySize;
                Provider.of<_SliderModel>(context).secondarySize = secondarySize;
                return _CreateSlideshow(topButtons: topButtons, slides: slides);
              },
            ),
          ),
      ),
    );
  }
}

class _CreateSlideshow extends StatelessWidget {
  const _CreateSlideshow({
    Key key,
    @required this.topButtons,
    @required this.slides,
  }) : super(key: key);

  final bool topButtons;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if(topButtons) _Dots(this.slides.length, ),
        Expanded(child: _Slides(this.slides)),
        if(!topButtons) _Dots(this.slides.length, ),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int qty;


  _Dots(this.qty, );
  
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
        children: List.generate(qty, (i) => _Dot(mediaSize: mediaSize, index: i, )),
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

    final model = Provider.of<_SliderModel>(context);

    return AnimatedContainer(
      height: (index - 0.5 < model.currentPage && index + 0.5 > model.currentPage) ? model.primarySize : model.secondarySize,
      width: (index - 0.5 < model.currentPage && index + 0.5 > model.currentPage) ? model.primarySize : model.secondarySize,
      margin: EdgeInsets.symmetric(horizontal: mediaSize.width * 0.02,),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (index - 0.5 < model.currentPage && index + 0.5 > model.currentPage) ? model._primary : model._secondary,
      ), 
      duration: Duration(milliseconds: 500),
    );
  }
}

class _Slides extends StatefulWidget {

  final List<Widget> slides;

  _Slides(this.slides);

  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {

  final pvCtrl = new PageController();


  @override
  void initState() { 
    pvCtrl.addListener(() {
      Provider.of<_SliderModel>(context, listen: false).currentPage = pvCtrl.page;
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
        children: widget.slides.map((slide) => _Slide(slide)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide(this.slide);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(30.0),
      child: slide,
    );
  }
}

class _SliderModel with ChangeNotifier{

  // Current Page
  double _currentPage = 0;

  double get currentPage => this._currentPage;

  set currentPage(double v) {
    this._currentPage = v;
    notifyListeners();
  }

  // Colores
  Color _primary = Colors.blue;
  Color _secondary = Colors.grey;

  Color get primary => this._primary;
  Color get secondary => this._secondary;

  set primary(Color c){
    this._primary = c;
    // notifyListeners();
  }

  set secondary(Color c){
    this._secondary = c;
    // notifyListeners();
  }
  
  // Bullet Size
  double _primarySize = 15.0;
  double _secondarySize = 10.0;

  double get primarySize => _primarySize;   
  double get secondarySize => _secondarySize; 

  set primarySize(double size){
    this._primarySize = size;
    // notifyListeners();
  }
  set secondarySize(double size){
    this._secondarySize = size;
    // notifyListeners();
  }
}