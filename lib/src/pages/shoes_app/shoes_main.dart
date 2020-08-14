
import 'package:flutter/material.dart';
import 'package:disenos/src/widgets/shoe_app/widget_index.dart';

class ShoesMainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          CustomAppbar(text: 'For you',),
          SizedBox(height: 30,),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ShoePreview(), 
                  SizedBox(height: 30,),
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                 
                ],
              ),
            ),
          ),
          
        ],
      )
      //,
   );
  }
}