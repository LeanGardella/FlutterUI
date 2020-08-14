
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {

  final String text;

  const CustomAppbar({Key key, this.text}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
          padding: EdgeInsets.only(top: 30),
          width: double.infinity,     
          child: Row(
            children: <Widget>[
              Text(this.text, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Colors.black),),
              Spacer(),
              Icon(Icons.search, size: 30, color: Colors.black,)
            ],
          ),
        ),
      ),
    );
  }
}