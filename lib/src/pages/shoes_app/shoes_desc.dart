import 'package:animate_do/animate_do.dart';
import 'package:disenos/src/helpers/helpers.dart';
import 'package:disenos/src/models/zapato_model.dart';
import 'package:disenos/src/widgets/shoe_app/widget_index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ShoesDescPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    cambiarStatusbar(dark: false);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(tag:'z1', child: ShoePreview(showSize: false)),
              Positioned(
                top: 80,
                child: FloatingActionButton(
                  child: Icon(Icons.chevron_left, color: Colors.white, size: 60,),
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    cambiarStatusbar(dark: true);
                    Navigator.pop(context);
                  },
                  elevation: 0,
                  highlightElevation: 0,
                ),
              ),

            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                children: <Widget>[
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _AmountBuyNow(),
                  SizedBox(height: 20,),
                  _Colors(),
                  SizedBox(height: 40,),
                  _IconButtons(),
                ],
              ),
            ),
          )
        ],
      )
   );
  }
}

class _IconButtons extends StatelessWidget {
  const _IconButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _IconButton(icon: Icons.favorite, color: Colors.red,),
        _IconButton(icon: Icons.shopping_cart, color: Colors.black12,),
        _IconButton(icon: Icons.settings, color: Colors.black12),
      ],
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final Color color;

  const _IconButton({Key key, this.icon = Icons.favorite, this.color = Colors.red}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0,10), blurRadius: 20 ,spreadRadius:-5)],
      ),
      child: Icon(icon, color: color, size: 30,),
    );
  }
}

class _Colors extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Positioned(left: 99 ,child: _RoundColoredButton(Color(0xffc6d642),4,'assets/img/verde.png')),
            Positioned(left: 66 ,child: _RoundColoredButton(Color(0xffffad29),3,'assets/img/amarillo.png')),
            Positioned(left: 33 ,child: _RoundColoredButton(Color(0xff2099f1),2,'assets/img/azul.png')),
            _RoundColoredButton(Color(0xff364d56),1,'assets/img/negro.png'),
            Container(width: 180,)
          ],
        ),
        Spacer(),
        BotonNaranja(h: 30, w: 170,text: 'More related items',color: Color(0xffffc675)),
      ],
    );
  }
}

class _RoundColoredButton extends StatelessWidget {
  final Color color;
  final int index;
  final String asset;
  const _RoundColoredButton(this.color, this.index, this.asset) ;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index *100),
      duration: Duration(milliseconds: 500),
      child: GestureDetector(
        onTap: () => Provider.of<ZapatoModel>(context, listen: false).assetImg = asset ,
        child: Container(
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: this.color,
          ),
        ),
      ),
    );
  }
}

class _AmountBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35),
      child: Row(
          children: <Widget>[
            //SizedBox(width: 0,),
            Text('\$ 180.0', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25.0)),
            Expanded(child: SizedBox()),
            Bounce(
              delay: Duration(seconds: 1),
              duration: Duration(milliseconds: 2000),
              from: 8,
              child: BotonNaranja(h: 45, w: 120,text: 'Buy now', )),
            //SizedBox(width: 20,),
          ],
        ),
    );
  }
}