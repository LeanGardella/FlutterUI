import 'package:flutter/material.dart';

class SliderModel with ChangeNotifier{

  // Current Page
  double _currentPage = 0;

  double get currentPage => this._currentPage;

  set currentPage(double v) {
    this._currentPage = v;
    notifyListeners();
  }

  // Colores
  Color _primary = Colors.blue;
  Color _secondary = Colors.grey;

  Color get primary => this._primary;
  Color get secondary => this._secondary;

  set primary(Color c){
    this._primary = c;
    notifyListeners();
  }

  set secondary(Color c){
    this._secondary = c;
    notifyListeners();
  }
}