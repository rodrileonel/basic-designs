import 'dart:io';

import 'package:designs/src/pages/basic_page.dart';
import 'package:designs/src/pages/buttons_page.dart';
import 'package:designs/src/pages/pages_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) { 

    //cambiar el efecto del statusbar con clor blanco en is y hacerlo transparente en android
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: ( Platform.isAndroid ) ? Colors.transparent : Colors.white
    ));
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Designs',
      initialRoute: 'pages',
      routes: {
        'basic':(BuildContext context) => BasicPage(),
        'pages':(BuildContext context) => PagesPage(),
        'buttons':(BuildContext context) => ButtonsPage(),
      },
    );
  }
}