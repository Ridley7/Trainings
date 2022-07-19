import 'package:chinese_flashcards/components/app/custom_app_bar.dart';
import 'package:chinese_flashcards/configs/constants.dart';
import 'package:flutter/material.dart';

import '../components/review_page/review_page.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kAppBarHeight),
        child: CustomAppBar(),
      ),

      body: Column(
        children: [
          Expanded(
              child: Row(
                children: [
                  HeaderButton(title: "Insert Card", callback: () {  },),
                  HeaderButton(title: "Clear Cards", callback: () {  },)
                ],
              )
          ),

          const Expanded(
            flex: 10,
              child: SizedBox()
          )
        ],
      ),
    );
  }
}

