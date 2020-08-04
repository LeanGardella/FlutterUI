import 'package:disenos/src/widgets/pinterest_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';


class PinterestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _MenuProvider(),
          child: Scaffold(
        //body: PinterestMenu(),
        // child: PinterestGrid(),
        body: Stack(
          children: <Widget>[
            PinterestGrid(),
            _PositionedPinterestMenu(),
          ],
        ),
   ),
    );
  }
}

class _PositionedPinterestMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final mostrar = Provider.of<_MenuProvider>(context).showMenu;
    return Positioned(
      bottom: 30,
      child: Align(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Align(
            child: PinterestMenu(
              show: mostrar,
              // backgroundColor: Colors.lightBlue,
              // primaryColor: Colors.red,
              // secondaryColor: Colors.yellow,
              options: [
                PinterestButton(button: Icons.pie_chart, onPressed: (){print('PieChart');}),
                PinterestButton(button: Icons.search, onPressed: (){print('Search');}),
                PinterestButton(button: Icons.notifications, onPressed: (){print('Notifications');}),
                PinterestButton(button: Icons.supervised_user_circle, onPressed: (){print('Supervised User');}),
              ],
            ),
          ),
        )
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {

  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  
  final List<int> items = List.generate(200, (index) => index);
  
  final ScrollController scrollCtrl = new ScrollController();
  double scrollOffset = 0;

  @override
  void initState() {
    scrollCtrl.addListener(() {
      _MenuProvider mp = Provider.of<_MenuProvider>(context, listen: false);
      if(scrollCtrl.offset > scrollOffset) {
        mp.showMenu = false;
        //print(scrollCtrl.offset);
        scrollOffset = scrollCtrl.offset;
      }
      else if( scrollCtrl.offset <= 0 || scrollCtrl.offset < scrollOffset){
        mp.showMenu = true;
        scrollOffset = scrollCtrl.offset;
        if(scrollCtrl.offset <= 0)
          scrollOffset = 0;

      }

      
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new StaggeredGridView.countBuilder(
        controller: scrollCtrl,
        crossAxisCount: 4,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.count(2, index.isEven ? 2 : 3),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  
  final index;
  const _PinterestItem(this.index, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.blue,
        ),
        child: new Center(
          child: new CircleAvatar(
            backgroundColor: Colors.white,
            child: new Text('$index'),
          ),
        ));
  }
}

class _MenuProvider with ChangeNotifier{
  bool _showMenu = true;

  bool get showMenu => this._showMenu;
  set showMenu (bool v){
    this._showMenu = v;
    notifyListeners();
  }

}