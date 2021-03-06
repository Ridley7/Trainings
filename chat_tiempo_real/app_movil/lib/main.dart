import 'package:app_movil/services/auth_service.dart';
import 'package:app_movil/services/chat_service.dart';
import 'package:app_movil/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:app_movil/routes/routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => AuthService()),
        ChangeNotifierProvider(create: ( _ ) => SocketService()),
        ChangeNotifierProvider(create: ( _ ) => ChatService()),
      ],
      child: MaterialApp(
        title: 'Chat App',
        initialRoute: 'loading',
        routes: app_routes,
      ),
    );
  }
}
