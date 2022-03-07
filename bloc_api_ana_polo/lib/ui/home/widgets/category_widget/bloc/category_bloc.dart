
import 'package:bloc/bloc.dart';
import 'package:bloc_api_ana_polo/repository/game_repository.dart';
import 'package:bloc_api_ana_polo/repository/service/models/genre.dart';
import 'package:equatable/equatable.dart';


part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {

  final GameRepository gameRepository;

  CategoryBloc({
    required this.gameRepository
}) : super(const CategoryState()){
    on<GetCategories>(_mapGetCategoriesEventToState);
    on<SelectCategory>(_mapSelectCategoriesEventToState);
  }

  void _mapGetCategoriesEventToState(GetCategories event, Emitter<CategoryState> emit) async{
    emit(state.copyWith(status: CategoryStatus.loading));

    try{
      final genres = await gameRepository.getGenres();

      emit(state.copyWith(status: CategoryStatus.success, categories: genres));
    }catch(error, stacktrace){
      emit(state.copyWith(status: CategoryStatus.error));
    }
  }

  //Creo que este metodo no deberia ser asincrono
  void _mapSelectCategoriesEventToState(SelectCategory event, Emitter<CategoryState> emit) async{

    emit(state.copyWith(status: CategoryStatus.selected, idSelected: event.idSelected));

  }



}
