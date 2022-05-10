part of 'all_games_bloc.dart';

enum AllGamesStatus{ initial, success, error, loading }

//Que es esto?
extension AllGamesStatusX on AllGamesStatus{
  bool get isInitial => this == AllGamesStatus.initial;
  bool get isSuccess => this == AllGamesStatus.success;
  bool get isError => this == AllGamesStatus.error;
  bool get isLoading => this == AllGamesStatus.loading;
}

class AllGamesState {

  final Game games;
  final AllGamesStatus status;

  const AllGamesState({
    Game? games,
    this.status = AllGamesStatus.initial,
  }) : games = games ?? Game.empty;

  List<Object?> get props => [status, games];

  AllGamesState copyWith({Game? games, AllGamesStatus? status}){
    return AllGamesState(games: games ?? this.games, status: status ?? this.status);
  }

}