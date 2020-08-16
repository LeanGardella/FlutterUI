import 'package:disenos/src/models/zapato_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoePreview extends StatelessWidget {
  final bool showSize;

  const ShoePreview({
    this.showSize = true,
  }) ;
  
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (showSize) ? maxWidth * 0.075 : maxWidth * 0.01, 
          vertical: (showSize) ? maxWidth * 0.01 : 3,
        ),
        child: Container(
          height: maxWidth,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xffffd54f),
            borderRadius: (showSize) ? 
            BorderRadius.circular(maxWidth *0.15) : 
            BorderRadius.only(bottomLeft: Radius.circular(maxWidth * 0.15) , bottomRight:Radius.circular(maxWidth * 0.15), topLeft: Radius.circular(maxWidth * 0.10), topRight: Radius.circular(maxWidth * 0.10)),
          ),
          child: Column(
            children: <Widget>[
              // Zapato con sombra
              _ShoeWithShadow(this.showSize),
              //  Talles
              if(showSize)
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
    final zapatoProv = Provider.of<ZapatoModel>(context);
    bool selected = this.text.compareTo(zapatoProv.talle) == 0;
     
    return GestureDetector(
      onTap: () => zapatoProv.talle = this.text,
      child: Container(
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
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  final bool showSize;
  _ShoeWithShadow( this.showSize);

  @override
  Widget build(BuildContext context) {
    final img = Provider.of<ZapatoModel>(context).assetImg;
    return Padding(
      padding: EdgeInsets.all(50),
      child: Stack(
        children: <Widget>[

          Positioned(
            bottom: 20,
            right: 0,
            child: _ShadowOfTheShoe(showSize)
          ),

          Image(image: AssetImage(img),),

        ],
      ),
    );
  }
}

class _ShadowOfTheShoe extends StatelessWidget {
  final bool showSize;
  _ShadowOfTheShoe(this.showSize);


  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: (showSize) ? 220: 270,
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