
import 'package:disenos/src/models/layout_model.dart';
import 'package:disenos/src/pages/slideshow_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:disenos/src/routes/routes.dart';
import 'package:disenos/src/themes/theme_changer.dart';

class LauncherTabletPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeCtrl = Provider.of<ThemeChanger>(context);
    final accentColor = themeCtrl.currentTheme.accentColor;
    final layout = Provider.of<LayoutModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños en Flutter - Tablet'),
        backgroundColor: accentColor,
      ),
      body: Row(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: 300,
            child: _ListaOpciones(),
          ),
          Container(
            width: 1,
            color: (themeCtrl.dark || themeCtrl.custom) ? Colors.grey[700] : accentColor,
          ),
          Expanded(child: layout.currentPage,),
        ],
      ),
      drawer: _MenuLateral(),
   );
  }
}

class _MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCtrl = Provider.of<ThemeChanger>(context);
    final accentColor = themeCtrl.currentTheme.accentColor;
    return Drawer(
          child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 200,
              child: CircleAvatar(
                backgroundColor: accentColor,
                child: Text('LG', style: TextStyle(fontSize: 50, ))
              )
            ),
            Expanded(child: _ListaOpciones(),),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: accentColor),
              title: Text('Dark theme'),
              trailing: Switch.adaptive(
                value: themeCtrl.dark, 
                onChanged: (value) => themeCtrl.dark = value,
                activeColor: accentColor,
              ),
            ),
            ListTile(
              leading: Icon(Icons.add_to_home_screen, color: accentColor),
              title: Text('Custom theme'),
              trailing: Switch.adaptive(
                value: themeCtrl.custom, 
                onChanged: (value) => themeCtrl.custom = value,
                activeColor: accentColor,
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}

class _ListaOpciones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeCtrl = Provider.of<ThemeChanger>(context);
    final accentColor = themeCtrl.currentTheme.accentColor;
    return ListView.separated(
      separatorBuilder: (context, i) => Divider(), 
      physics: BouncingScrollPhysics(),
      itemCount: pageRoutes.length,
      itemBuilder: (context, i) => ListTile(
        leading: FaIcon(pageRoutes[i].icon, color: accentColor),
        title: Text(pageRoutes[i].title),
        trailing: Icon(Icons.chevron_right, color: accentColor),
        onTap: (){
          // Navigator.push(context, MaterialPageRoute(builder: (context) => pageRoutes[i].page));

          final layout = Provider.of<LayoutModel>(context, listen: false);
          layout.currentPage = pageRoutes[i].page;
        },
      ), 
    );
  }
}