import 'package:flutter/material.dart';


const String settingsPage = 'settings';
const String pointServicePage = 'pointService';


// Control our page route flow
Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {

    case settingsPage:
      // return MaterialPageRoute(builder: (context) => const SettingsPage());

/*
    case pointServicePage:
      final code = settings.arguments as PointServiceArguments;
      return MaterialPageRoute(builder: (context) => PointServicePage(args: code));

*/


    default:
      throw('This route name does not exit');
  }
}