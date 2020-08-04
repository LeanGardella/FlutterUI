import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestMenu extends StatelessWidget {

  final bool show;
  final Color backgroundColor;
  final Color primaryColor;
  final Color secondaryColor;
  final List<PinterestButton> options;

  PinterestMenu({
    this.show = true,
    this.backgroundColor = Colors.white,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.blueGrey,
    @required this.options,
  });


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (BuildContext context) { return new _MenuModel(); },
      child:  AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: (show) ? 1.0 : 0.0,
        child: Builder(builder: (context ) {
          final prov = Provider.of<_MenuModel>(context);
          prov.backgroundColor = backgroundColor;
          prov.primaryColor= primaryColor;
          prov.secondaryColor = secondaryColor;
          return _PinterestMenuContainer(
            children: _MenuItems( options),
          );
        })
      )
    );
  }
}

class _PinterestMenuContainer extends StatelessWidget {
  final _MenuItems children;
  const _PinterestMenuContainer({ this.children }) ;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<_MenuModel>(context);
    return AnimatedContainer(
        width: 250,
        height: 60,
        decoration: BoxDecoration(
          color: prov.backgroundColor,
          borderRadius: BorderRadius.circular(60),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black38,
              offset: Offset(3,3),
              blurRadius: 10,
              spreadRadius: -3,
            )
          ],
        ),
        duration: Duration(milliseconds: 500),
        child: children,
      );

  }
}

class _MenuItems extends StatelessWidget {
  final List<PinterestButton> menuItems;

  const _MenuItems( this.menuItems);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (index) => _PinterestMenuButton(index, menuItems[index])),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {

  final int index;
  final PinterestButton btn;

  const _PinterestMenuButton(this.index, this.btn) ;

  
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<_MenuModel>(context);
    final idx = prov.selectedIndex;
    

    return GestureDetector(
      onTap: (){
        Provider.of<_MenuModel>(context, listen: false).selectedIndex = index;
        btn.onPressed();
      },
      behavior: HitTestBehavior.translucent, // en algunos dispostivos, resuelve bug.
      child: Container(
        child: Icon(
          btn.button, 
          size: (idx == index) ? 35 : 30,
          color: (idx == index) ? prov.primaryColor : prov.secondaryColor,
        )
      ),
    );
  }
}

class PinterestButton{
  final Function onPressed;
  final IconData button;

  PinterestButton({ @required this.onPressed, @required this.button});
  
}

class _MenuModel with ChangeNotifier{
  int _selectedIndex = 0;
  Color _backgroundColor;
  Color _primaryColor ;
  Color _secondaryColor;

  int get selectedIndex => this._selectedIndex;

  set selectedIndex (int v){
    this._selectedIndex = v;
    notifyListeners();
  }

    Color get backgroundColor => this._backgroundColor;
  set backgroundColor ( Color c ){
    this._backgroundColor = c;
  }

  Color get primaryColor => this._primaryColor;
  set primaryColor ( Color c ){
    this._primaryColor = c;
  }

  Color get secondaryColor => this._secondaryColor;
  set secondaryColor ( Color c ){
    this._secondaryColor = c;
  }
}