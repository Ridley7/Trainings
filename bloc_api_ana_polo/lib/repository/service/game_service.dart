
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class GameService{

  final String baseUrl;
  final Client _httpClient;

  GameService({
    //Esta parte no me queda del todo clara, pero es para montarte la URI
    //con un solo metodo y no usando varios como suelo hacer
    http.Client? httpClient,
    this.baseUrl = 'https://api.rawg.io/api',
  }) : _httpClient = httpClient ?? http.Client();

  Uri getUrl({required String url, Map<String, String>? extraParameters})
  {
    final queryParameters = <String, String>{
      //'key': dotenv.get('GAMES_API_KEY') --> Hay que aprender a usar variablles de entorno.
      'key': 'e45739b262a6498e959b58c54cb011d3'
    };

    if(extraParameters != null){
      queryParameters.addAll(extraParameters);
    }

    return Uri.parse('$baseUrl/$url').replace(
      queryParameters: queryParameters
    );
  }

  //Preguntarle a Ana porque los modelos estan formados por dos archivos

}