import 'package:bloc_api_ana_polo/repository/game_repository.dart';
import 'package:bloc_api_ana_polo/repository/service/game_service.dart';
import 'package:bloc_api_ana_polo/ui/home/pages/home_layout.dart';
import 'package:bloc_api_ana_polo/ui/home/widgets/all_games_widget/bloc/all_games_bloc.dart';
import 'package:bloc_api_ana_polo/ui/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: RepositoryProvider(
        create: (context) => GameRepository(service: GameService()),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<AllGamesBloc>(
                create: (context) => AllGamesBloc(
                    gameRepository: context.read<GameRepository>()
                )..add(GetGames()),
            ),

            BlocProvider<CategoryBloc>(
                create: (context) => CategoryBloc(
                    gameRepository: context.read<GameRepository>(),
                )..add(GetCategories()),
            ),
          ],
          child: HomeLayout(),
        ),
      ),
    );
  }
}
