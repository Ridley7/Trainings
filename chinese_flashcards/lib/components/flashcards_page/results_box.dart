import 'package:chinese_flashcards/pages/flashcards_page.dart';
import 'package:chinese_flashcards/pages/home_page.dart';
import 'package:chinese_flashcards/providers/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ResultsBox extends StatelessWidget {
  const ResultsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardsNotifiers>(
      builder: (_, notifier, __) {
        return AlertDialog(
        title: Text(
          notifier.isSessionCompleted ? 'Session Completed!' : 'Round Completed!',
          textAlign: TextAlign.center,
        ),
        actions: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              notifier.isSessionCompleted ? SizedBox() : ElevatedButton(
                  onPressed: (){
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FlashCardsPage()));
                  },
                  child: Text('Retest Incorrect Cards')
              ),

              ElevatedButton(
                  onPressed: (){
                    notifier.reset();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                            (route) => false
                    );
                  },
                  child: Text('Home')
              )

            ],
          ),


        ],
      );
      },
    );
  }
}
