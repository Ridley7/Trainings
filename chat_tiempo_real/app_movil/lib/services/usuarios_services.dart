import 'package:app_movil/global/environment.dart';
import 'package:app_movil/models/usuario.dart';
import 'package:app_movil/models/usuarios_response.dart';
import 'package:app_movil/services/auth_service.dart';
import 'package:http/http.dart' as http;

class UsuariosService{

  Future<List<Usuario>> getUsuarios() async{
    try{

      final resp = await http.get(Uri.parse('${Environment.apiUrl}/usuarios'),
        headers: {
          'Content-Type': 'application/json',
          'x-token': await AuthService.getToken() as String
        }
      );

      final usuariosResponse = usuariosResponseFromJson(resp.body);

      return usuariosResponse.usuarios;

    }catch(e){
      return [];
    }
  }

}