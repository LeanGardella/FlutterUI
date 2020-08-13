
import 'package:disenos/src/models/layout_model.dart';
import 'package:disenos/src/pages/launcher_tablet_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:disenos/src/pages/launcher_page.dart';
import 'package:disenos/src/themes/theme_changer.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeChanger>( create: (BuildContext context)  => new ThemeChanger(1) ,),
      ChangeNotifierProvider<LayoutModel>( create: (BuildContext context)  => new LayoutModel() ,),
    ],
    child: MyApp()
  )
);
// void main() => runApp(
//   ChangeNotifierProvider(
//     create: (BuildContext context)  => new ThemeChanger(1) ,
//     child: MyApp()
//   )
// );
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final themeCtrl = Provider.of<ThemeChanger>(context);

    return  MaterialApp(
        theme: themeCtrl.currentTheme,
        debugShowCheckedModeBanner: false,
        title: 'UI App',
        home: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            final screenSize = MediaQuery.of(context).size;

            if(screenSize.width > 500){//Tablet
              return LauncherTabletPage();
            } else { //Tel
              return LauncherPage();
            }
          },
        ),
    );
  }
}