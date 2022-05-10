import 'package:bloc_api_ana_polo/repository/service/models/genre.dart';
import 'package:bloc_api_ana_polo/ui/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:bloc_api_ana_polo/ui/home/widgets/category_widget/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesSuccessWidget extends StatelessWidget {
  const CategoriesSuccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state){
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                shrinkWrap: true,
                itemBuilder: (context, index){
                return CategoryItem(
                    category: state.categories[index],
                    callback: (Genre categorySelected){
                      //context.read<GamesByCategoryBloc>()
                      print("Aqui va un bloc");
                          //Aqui me quedo
                    }
                );
                },
                separatorBuilder: (_, __) => const SizedBox(
                  width: 16.0,
                ),
                itemCount: state.categories.length,
              scrollDirection: Axis.horizontal,
            ),
          );
        }
    );
  }
}
