import 'package:flutter/material.dart';


class SliverListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _FooterButton()
          ),
        ],
      )
    );
  }
}

class _FooterButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ButtonTheme(
      buttonColor: Color(0xffED6762),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft:Radius.circular(50))),
      height: size.height * 0.12,
      minWidth: size.width * 0.9,
      child: RaisedButton(
        onPressed: (){},
        child: Text('CREATE NEW LIST', style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
        ),),
      ),
    );
  }
}

class _MainScroll extends StatelessWidget {

  final items = [
    _ItemLista( 'Orange', Color(0xffF08F66) ),
    _ItemLista( 'Family', Color(0xffF2A38A) ),
    _ItemLista( 'Subscriptions', Color(0xffF7CDD5) ),
    _ItemLista( 'Books', Color(0xffFCEBAF) ),
    _ItemLista( 'Orange', Color(0xffF08F66) ),
    _ItemLista( 'Family', Color(0xffF2A38A) ),
    _ItemLista( 'Subscriptions', Color(0xffF7CDD5) ),
    _ItemLista( 'Books', Color(0xffFCEBAF) ),
    _ItemLista( 'Orange', Color(0xffF08F66) ),
    _ItemLista( 'Family', Color(0xffF2A38A) ),
    _ItemLista( 'Subscriptions', Color(0xffF7CDD5) ),
    _ItemLista( 'Books', Color(0xffFCEBAF) ),
    _ItemLista( 'Orange', Color(0xffF08F66) ),
    _ItemLista( 'Family', Color(0xffF2A38A) ),
    _ItemLista( 'Subscriptions', Color(0xffF7CDD5) ),
    _ItemLista( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[

        // SliverAppBar(
        //   floating: true,
        //   backgroundColor: Color(0xffF2A38A),
        //   title: Text('Lista de colores'),
        //   elevation: 0,
        // ),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverPersistentHeaderDelegate(
            maxHeight: 200,
            minHeight: 170,
            child: Container(
              color: Colors.white,
              alignment: Alignment.centerLeft,
              child: _Header(),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(height: 150),
          ],
          ),
        ),
      ],
    );
  }
}

class _SliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
   
  final double maxHeight;
  final double minHeight;
  final Widget child;

  _SliverPersistentHeaderDelegate({
    @required this.maxHeight, 
    @required this.minHeight, 
    @required this.child
  });  
   
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_SliverPersistentHeaderDelegate oldDelegate) {
    return minHeight != oldDelegate.minHeight ||
           maxHeight != oldDelegate.maxHeight ||
           child     != oldDelegate.child;
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 30,),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text('New', style: TextStyle(color: Color(0xff532128), fontSize: 50),),
        ),
        Stack(
          children: <Widget>[
            SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 120,
                height: 8,
                decoration: BoxDecoration(
                  color: Color(0xfff7cdd5),
                ),
              ),
            ),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Text('List', style: TextStyle(color: Color(0xffd93a30), fontSize: 50, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ],
    );
  }
}

class _Lista extends StatelessWidget {
  final items = [
    _ItemLista( 'Orange', Color(0xffF08F66) ),
    _ItemLista( 'Family', Color(0xffF2A38A) ),
    _ItemLista( 'Subscriptions', Color(0xffF7CDD5) ),
    _ItemLista( 'Books', Color(0xffFCEBAF) ),
    _ItemLista( 'Orange', Color(0xffF08F66) ),
    _ItemLista( 'Family', Color(0xffF2A38A) ),
    _ItemLista( 'Subscriptions', Color(0xffF7CDD5) ),
    _ItemLista( 'Books', Color(0xffFCEBAF) ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: ( context, index ) => items[index],
    );
  }
}

class _ItemLista extends StatelessWidget {
  const _ItemLista(
  this.titulo, this.color,
  ) ;

  final String titulo;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color
      ),
      child: Text(titulo, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
    );
  }
}