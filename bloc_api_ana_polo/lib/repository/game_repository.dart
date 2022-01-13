
import 'package:bloc_api_ana_polo/repository/service/game_service.dart';
import 'package:bloc_api_ana_polo/repository/service/models/game.dart';
import 'package:bloc_api_ana_polo/repository/service/models/genre.dart';
import 'package:bloc_api_ana_polo/repository/service/models/result.dart';

class GameRepository{

  final GameService service;

  GameRepository({required this.service});

  Future<Game> getGames() async => service.getGames();

  Future<List<Genre>> getGenres() async => service.getGenres();

  Future<List<Result>> getGamesByCategory(int genreId) async => service.getGamesByCategory(genreId);

}