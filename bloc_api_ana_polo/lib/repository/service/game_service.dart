
import 'dart:convert';

import 'package:bloc_api_ana_polo/repository/service/models/game.dart';
import 'package:bloc_api_ana_polo/repository/service/models/genre.dart';
import 'package:bloc_api_ana_polo/repository/service/models/result.dart';
import 'package:bloc_api_ana_polo/repository/service/models/result_error.dart';
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

  Future<Game> getGames() async{
    final response = await _httpClient.get(getUrl(url: 'games'));

    //Comprobamos que el status es Ok
    if(response.statusCode == 200){
      //Comprobamos que hay contenido
      if(response.body.isNotEmpty){
        return Game.fromJson(jsonDecode(response.body)
        );
      }
      else{
        throw ErrorEmptyResponse();
      }
    }else{
      throw ErrorGettingGames('Error getting games');
    }
  }

  Future<List<Genre>> getGenres() async{
    final response = await _httpClient.get(getUrl(url: 'genres'));

    if(response.statusCode == 200){
      if(response.body.isNotEmpty){
        return List<Genre>.from(
          json.decode(response.body)['results'].map(
              (data) => Genre.fromJson(data),
          )
        );
      }
      else{
        throw ErrorEmptyResponse();
      }
    }
    else{
      throw ErrorGettingGames('Error getting games');
    }
  }

  Future<List<Result>> getGamesByCategory(int genreId) async{
    final response = await _httpClient.get(
      getUrl(
        url: 'games',
        extraParameters: {
          'genres': genreId.toString(),
        },
      ),
    );

    if(response.statusCode == 200){
      if(response.body.isNotEmpty){
        return List<Result>.from(
          json.decode(response.body)['results'].map(
              (data) => Result.fromJson(data),
          ),
        );
      } else {
        throw ErrorEmptyResponse();
      }
    } else{
      throw ErrorGettingGames("Error getting games");
    }
  }

}