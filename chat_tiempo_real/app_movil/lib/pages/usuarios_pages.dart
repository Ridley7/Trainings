import 'package:app_movil/models/usuario.dart';
import 'package:app_movil/services/auth_service.dart';
import 'package:app_movil/services/chat_service.dart';
import 'package:app_movil/services/socket_service.dart';
import 'package:app_movil/services/usuarios_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key? key}) : super(key: key);

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);
  final usuarioService = new UsuariosService();

  List<Usuario> usuarios = [];

  @override
  void initState() {
    // TODO: implement initState
    this._cargarUsuarios();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final authService = Provider.of<AuthService>(context);
    final usuario = authService.usuario;

    final socketService = Provider.of<SocketService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(usuario.nombre, style: TextStyle(color: Colors.black87),),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app, color: Colors.black87,),
          onPressed: (){

            socketService.disconnect();
            Navigator.pushReplacementNamed(context, 'login');
            AuthService.deleteToken();


          },
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: (socketService.serverStatus == ServerStatus.Online)
              ? Icon(Icons.check_circle, color: Colors.blue[400])
                : Icon(Icons.offline_bolt, color: Colors.red)
          )
        ],
      ),

      body: SmartRefresher(
        controller: _refreshController,
        header: WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.blue[400],),
          waterDropColor: Colors.blue,
        ),
        onRefresh: _cargarUsuarios,
        child: _listViewUsuarios(),
      )

    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
        itemBuilder: (_, i) => _usuarioListTile(usuarios[i]),
        separatorBuilder: (_, i) => Divider(),
        itemCount: usuarios.length
    );
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
          title: Text(usuario.nombre),
          subtitle: Text(usuario.email),
          leading: CircleAvatar(
            child: Text(usuario.nombre.substring(0,2)),
            backgroundColor: Colors.blue[100],
          ),

          trailing: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: usuario.online ? Colors.green[300] : Colors.red,
              borderRadius: BorderRadius.circular(100)
            ),
          ),

      onTap: (){
            final ChatService chatService = Provider.of<ChatService>(context, listen: false);
            chatService.usuarioPara = usuario;
            Navigator.pushNamed(context, 'chat');
      },

        );
  }

  void _cargarUsuarios() async{

    //Asi se simula una llamada a una API, creo
    //await Future.delayed(Duration(milliseconds: 1000));

    this.usuarios = await usuarioService.getUsuarios();
    setState(() {

    });

    _refreshController.refreshCompleted();
  }
}
