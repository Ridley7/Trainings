import 'package:bloc_api_ana_polo/ui/home/widgets/category_widget/categories_widget.dart';
import 'package:bloc_api_ana_polo/ui/home/widgets/header_title/header_title.dart';
import 'package:bloc_api_ana_polo/ui/widgets/container_body.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 80.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderTitle(),
          const SizedBox(height: 40.0,),
          ContainerBody(
              children: [
                CategoriesWidget(),
                GamesByCategoryWidget(),
              ]
          )
        ],
      ),
    );
  }
}
