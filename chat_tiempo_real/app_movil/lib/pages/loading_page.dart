import 'package:app_movil/pages/login_page.dart';
import 'package:app_movil/pages/usuarios_pages.dart';
import 'package:app_movil/services/auth_service.dart';
import 'package:app_movil/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot){
          return Center(
            child: Text('Espere...'),
          );
        },
      )
    );
  }

  Future checkLoginState(BuildContext context) async{

    final authService = Provider.of<AuthService>(context, listen: false);
    final socketService = Provider.of<SocketService>(context, listen: false);

    final autenticado = await authService.isLoggedIn();

    if(autenticado){

      socketService.connect();

      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: ( _, __, ___) => UsuariosPage(),
            transitionDuration: Duration(milliseconds: 0)
          )
      );

    }else{

      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: ( _, __, ___) => LoginPage(),
              transitionDuration: Duration(milliseconds: 0)
          )
      );

    }

    print("FLag 300");

  }
}
