import 'package:bloc_api_ana_polo/ui/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:bloc_api_ana_polo/ui/home/widgets/category_widget/categories_success_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      buildWhen: (previous, current) => current.status.isSuccess,
        builder: (context, state){
          return CategoriesSuccessWidget();
        }
    );
  }
}
