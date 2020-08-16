import 'package:flutter/services.dart' as services;

void cambiarStatusbar({bool dark = false}){
  if(dark){
    services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle.dark);
  }else{
    services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle.light);
  }
}