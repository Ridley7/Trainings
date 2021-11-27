import 'package:band_names/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Band names',
      initialRoute: 'home',
      routes: {
        'home' : ( _ ) => Home()
      },
    );
  }
}

