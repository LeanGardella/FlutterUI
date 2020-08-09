import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  bool _dark = false;
  bool _custom = false;

  ThemeData _currentTheme = ThemeData.light();

  ThemeChanger(int v){
    switch (v) {
      case 0: //light
        _dark = false;
        _custom = false;
        _currentTheme = ThemeData.light();
        break;
      case 1: //dark
        _dark = true;
        _custom = false;
        _currentTheme = ThemeData.dark();
        break;
      case 2: //custom
        _dark = false;
        _custom = true;
        _currentTheme = ThemeData.dark().copyWith(
        accentColor: Color(0xff48A0EB),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202B),
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
      );
        break;
      default: // light
        _dark = false;
        _custom = false;
        _currentTheme = ThemeData.light();
    }
  }

  ThemeData get currentTheme => this._currentTheme;

  bool get dark => this._dark;
  set dark(bool v) {
    if(v){
      this._custom = false;
      this._currentTheme = ThemeData.dark();
    } else {
      this._currentTheme = ThemeData.light();
    }
    this._dark = v;
    notifyListeners();
  }

  bool get custom => this._custom;
  set custom(bool v){
    if(v){
      this._dark = false;
      this._currentTheme = ThemeData.dark().copyWith(
        accentColor: Color(0xff48A0EB),
        primaryColorLight: Colors.white,
        scaffoldBackgroundColor: Color(0xff16202B),
        textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
      );
    }else{
      this._currentTheme = ThemeData.dark();
    }
    this._custom = v;
    notifyListeners();
  }
}