import 'package:disenos/src/widgets/shoe_app/widget_index.dart';
import 'package:flutter/material.dart';
class CartFooter extends StatelessWidget {
  
  final double amount;

  const CartFooter({Key key, this.amount}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 100,
      padding: EdgeInsets.all(5),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: <Widget>[
            SizedBox(width: 20,),
            Text('\$ ${amount.toString()}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25.0)),
            Expanded(child: SizedBox()),
            BotonNaranja(h: 45, w: 140,text: 'Add to cart',),
            SizedBox(width: 20,),
          ],
        ),
      ),
    );
  }
}

