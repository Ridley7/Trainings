import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:band_names/providers/socket_provider.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final socketProvider = Provider.of<SocketProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Server Status: ${socketProvider.serverStatus}')
          ],
        )
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          socketProvider.socket.emit("emitir-mensaje", {
            'nombre': 'flutter',
            'mensaje': 'Hola desde flutter'
          });
        },
      ),
    );
  }
}
