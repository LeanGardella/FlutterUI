import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class NavegacionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) { return new _NotificationModel(); },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
          backgroundColor: Colors.deepPurple,
        ),

        floatingActionButton: _FloatingButton(),

        bottomNavigationBar: _BottomBar(),
   ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.deepPurple,
      currentIndex: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          title: Text('Bones'),
          icon: FaIcon(FontAwesomeIcons.bone),
        ),
        BottomNavigationBarItem(
          title: Text('Notifications'),
          icon: Stack(
            children: <Widget>[
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0,
                right: 0,
                child: BounceInDown(
                  from: 15,
                  animate: (Provider.of<_NotificationModel>(context).numero > 0 ) ? true : false,
                  child: Bounce(
                    from: 10,
                    controller: (c) => Provider.of<_NotificationModel>(context).bounceCtrl = c ,
                    child: _NotificationBadge()
                  )
                ),
              ),
            ],
          ),
        ),
        BottomNavigationBarItem(
          title: Text('My Dog'),
          icon: FaIcon(FontAwesomeIcons.dog),
        ),
      ],
      
    );
  }
}

class _NotificationBadge extends StatelessWidget {
  const _NotificationBadge({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        shape: BoxShape.circle
      ),
      child: Text('${Provider.of<_NotificationModel>(context).numero}', style: TextStyle(fontSize: 7, color: Colors.white)),
    );
  }
}

class _FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: FaIcon(FontAwesomeIcons.play),
      backgroundColor: Colors.deepPurple,
      onPressed: (){
        final prov = Provider.of<_NotificationModel>(context, listen: false);
        prov.numero = prov.numero + 1;

        if(prov.numero >= 2){
          prov.bounceCtrl.forward(from: 0.0);
        }
      },
    );
  }
}


class _NotificationModel extends ChangeNotifier{
  int _numero = 0;
  int get numero => this._numero;
  set numero( int n ) {
    this._numero = n;
    notifyListeners();
  }  

  AnimationController _bounceCtrl;
  AnimationController get bounceCtrl => this._bounceCtrl;
  set bounceCtrl(AnimationController c) {
    this._bounceCtrl = c;
   // notifyListeners();
  }
}