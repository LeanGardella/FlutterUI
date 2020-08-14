import 'package:flutter/material.dart';

class ShoePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: maxWidth * 0.075, vertical: maxWidth * 0.01),
        child: Container(
          height: maxWidth,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffd54f),
            borderRadius: BorderRadius.circular(maxWidth *0.15),
          ),
          child: Column(
            children: <Widget>[
              // Zapato con sombra
              _ShoeWithShadow(),
              //  Talles
              _ShoeSizes(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
         
          _SizeOptBox('7'),
          _SizeOptBox('7.5'),
          _SizeOptBox('8'),
          _SizeOptBox('8.5'),
          _SizeOptBox('9'),
          _SizeOptBox('9.5'),
       
        ],
      ),
    );
  }
}

class _SizeOptBox extends StatelessWidget {
  final String text;

  const _SizeOptBox(this.text);

  @override
  Widget build(BuildContext context) {
    bool selected = this.text.compareTo('9') == 0;
     
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: (selected) ? Color(0xfff69f39) : Color(0xfffbfffa),
        borderRadius: BorderRadius.circular(10),
        boxShadow: (selected) ? [
          BoxShadow(
          color: Color(0xfff69f39),
          offset: Offset(0,7),
          blurRadius: 7,
        ) ]: [],
        
      ),
      child: Center(
        child: Text(this.text, 
          style: TextStyle(
            color: (selected) ? Color(0xfffbfffa) : Color(0xfff69f39), 
            fontWeight: FontWeight.bold
          ),
        )
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50),
      child: Stack(
        children: <Widget>[

          Positioned(
            bottom: 20,
            right: 0,
            child: _ShadowOfTheShoe()
          ),

          Image(image: AssetImage('assets/img/negro.png'),),

        ],
      ),
    );
  }
}

class _ShadowOfTheShoe extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 100,
        decoration: BoxDecoration(
          //color: Colors.red,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Color(0xfff69f39),
              blurRadius: 40,
            ),
          ]
        ),
      ),
    );
  }
}