import 'package:band_names/pages/home.dart';
import 'package:band_names/pages/status.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:band_names/providers/socket_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SocketProvider())
        ],
      child: MaterialApp(
        title: 'Band names',
        initialRoute: 'home',
        routes: {
          'home' : ( _ ) => Home(),
          'status': ( _ ) => StatusPage(),
        },
      ),
    );
  }
}

