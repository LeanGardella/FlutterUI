
import 'package:disenos/src/helpers/helpers.dart';
import 'package:disenos/src/pages/shoes_app/shoes_desc.dart';
import 'package:flutter/material.dart';
import 'package:disenos/src/widgets/shoe_app/widget_index.dart';

class ShoesMainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    cambiarStatusbar(dark: true);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          CustomAppbar(text: 'For you',),
          SizedBox(height: 30,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                      GestureDetector(
                        child: Hero(tag:'z1',child: ShoePreview()),
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context ) => ShoesDescPage()))
                      ),
                      SizedBox(height: 30,),
                      ShoeDescription(
                        title: 'Nike Air Max 720',
                        description: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                      ),
                ]
              ),
            ),
          ),
          CartFooter(amount: 180.0),
        ],
      )
      //,
   );
  }
}