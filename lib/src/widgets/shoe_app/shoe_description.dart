import 'package:flutter/material.dart';

class ShoeDescription extends StatelessWidget {

  final String title;
  final String description;

  const ShoeDescription({Key key, @required this.title, @required this.description}) ;

  @override
  Widget build(BuildContext context) {

    final TextStyle _titleStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 25.0,
      
    );
    final TextStyle _descriptionStyle = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w500,
      fontSize: 14.0,
      height: 1.6,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: _titleStyle,),
        SizedBox(height: 20,),
        Text(description, style: _descriptionStyle,),
      ],
    );
  }
}