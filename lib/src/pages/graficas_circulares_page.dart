import 'package:disenos/src/themes/theme_changer.dart';
import 'package:disenos/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class GraficasCircularesPage extends StatefulWidget {
  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {

  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          porcentaje += 10.0;
          if(porcentaje > 100) porcentaje = 0.0;
          setState(() {
            //print('PORCENTAJE: $porcentaje');
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje, ),
              CustomRadialProgress(porcentaje: porcentaje * 1.2,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomRadialProgress(porcentaje: porcentaje * 1.3,),
              CustomRadialProgress(porcentaje: porcentaje * 1.1,),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  final double porcentaje;


  const CustomRadialProgress({
    @required this.porcentaje
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width*0.4,
        height: MediaQuery.of(context).size.width*0.4,
        // color: Colors.red,
        child: RadialProgress( 
          progress: porcentaje , 
          showText: true, 
          duration: Duration( milliseconds: 500), 
          primaryColor: (theme.dark) ? Colors.blue[600] :  Colors.blue[900],
          secondaryColor: theme.currentTheme.textTheme.bodyText1.color,
          primaryStrokeWidth: MediaQuery.of(context).size.width*0.02,
          secondaryStrokeWidth: MediaQuery.of(context).size.width*0.01,
          fontSize: MediaQuery.of(context).size.width*0.08,
          gradient: RadialGradient(
            colors: [
              Colors.blue[900],
              Colors.deepPurple,
              Colors.purple,
            ]
          ),
        ),
      ),
    );
  }
}