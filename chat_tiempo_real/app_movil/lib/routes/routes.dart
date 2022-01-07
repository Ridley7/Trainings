import 'package:app_movil/pages/chat_page.dart';
import 'package:app_movil/pages/loading_page.dart';
import 'package:app_movil/pages/login_page.dart';
import 'package:app_movil/pages/register_page.dart';
import 'package:app_movil/pages/usuarios_pages.dart';
import 'package:flutter/cupertino.dart';

final Map<String, Widget Function(BuildContext)> app_routes = {
  'usuarios': ( _ ) => UsuariosPage(),
  'login': ( _ ) => LoginPage(),
  'register': ( _ ) => RegisterPage(),
  'loading': ( _ ) => LoadingPage(),
  'chat': ( _ ) => ChatPage()
};