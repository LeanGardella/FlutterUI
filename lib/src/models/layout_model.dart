import 'package:disenos/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';

class LayoutModel with ChangeNotifier {
  Widget _currentPage = SlideshowPage();

  set currentPage ( Widget w ){
    this._currentPage = w;
    notifyListeners();
  }
  Widget get currentPage => this._currentPage;
}