import 'package:flutter/material.dart';

class ZapatoModel with ChangeNotifier{

  String _assetImg = 'assets/img/azul.png';
  String _talle = '9';

  String get assetImg => this._assetImg;
  String get talle => this._talle;

  set assetImg(String v) {
    this._assetImg = v;
    notifyListeners();
  }

  set talle(String v) {
    this._talle = v;
    notifyListeners();
  }

}