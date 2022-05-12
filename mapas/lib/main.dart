import 'package:flutter/material.dart';

void main() {
  runApp(const MapsApp());
}

class MapsApp extends StatelessWidget {

  const MapsApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'MappsApp',
      home: Scaffold(
        body: Center(
          child: Text("Hola mundo")
        ),
      )
    );
  }
}
