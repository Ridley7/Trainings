import 'package:app_movil/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class UsuariosPage extends StatefulWidget {
  const UsuariosPage({Key? key}) : super(key: key);

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);

  final usuarios = [
    Usuario(online: true, email: 'test1@test.com', nombre: 'Maria', uid: '1'),
    Usuario(online: false, email: 'test2@test.com', nombre: 'Carlos', uid: '2'),
    Usuario(online: true, email: 'test3@test.com', nombre: 'Felipe', uid: '3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi nombre', style: TextStyle(color: Colors.black87),),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.exit_to_app, color: Colors.black87,),
          onPressed: (){},
        ),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle), color: Colors.blue[400],
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
        );
  }

  void _cargarUsuarios() async{

    //Asi se simula una llamada a una API, creo
    await Future.delayed(Duration(milliseconds: 1000));

    _refreshController.refreshCompleted();
  }
}
