import 'package:app_movil/global/environment.dart';
import 'package:app_movil/models/mensajes_response.dart';
import 'package:app_movil/models/usuario.dart';
import 'package:app_movil/services/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ChatService with ChangeNotifier{

  late Usuario usuarioPara;

  Future <List<Mensaje>> getChat (String usuarioID) async{

    final resp = await http.get(Uri.parse('${ Environment.apiUrl}/mensajes/$usuarioID'),
      headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken() as String
      }
    );

    final mensajesResp = mensajesResponseFromJson(resp.body);

    return mensajesResp.mensajes;

  }

}