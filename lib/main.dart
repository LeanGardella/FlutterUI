
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:disenos/src/pages/launcher_page.dart';
import 'package:disenos/src/themes/theme_changer.dart';

void main() => runApp(
  ChangeNotifierProvider(
    create: (BuildContext context)  => new ThemeChanger(1) ,
    child: MyApp()
  )
);
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final themeCtrl = Provider.of<ThemeChanger>(context);

    return  MaterialApp(
        theme: themeCtrl.currentTheme,
        debugShowCheckedModeBanner: false,
        title: 'UI App',
        home: LauncherPage(),
      
    );
  }
}