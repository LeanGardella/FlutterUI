import 'package:flutter/material.dart';


class SliverListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _MainScroll()
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
        SliverAppBar(
          floating: true,
          backgroundColor: Color(0xffF2A38A),
          title: Text('Lista de colores'),
          elevation: 0,
        ),
        
        SliverList(
          delegate: SliverChildListDelegate(items),
        ),
      ],
    );
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