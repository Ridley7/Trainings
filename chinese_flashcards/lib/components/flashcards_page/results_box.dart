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
          actionsPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        title: Text(
          notifier.isSessionCompleted
              ? 'Session Completed!'
              : 'Round Completed!',
          textAlign: TextAlign.center,
        ),
        actions: [
          Table(
            columnWidths: {
              0: FlexColumnWidth(3),
              1: FlexColumnWidth(1),
            },
            children: [
              buildTableRow(title: "Total Rounds", stat: notifier.roundTotally.toString()),
              buildTableRow(title: "No. Card", stat: notifier.cardTotally.toString()),
              buildTableRow(title: "No. Correct", stat: notifier.correctTotally.toString()),
              buildTableRow(title: "No. Incorrect", stat: notifier.incorrectTotally.toString()),
              buildTableRow(title: "Correct Percentage", stat: "${notifier.correctPercentage.toString()}%"),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
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
            ),
          ),


        ],
      );
      },
    );
  }

  TableRow buildTableRow({required String title, required String stat}) {
    return TableRow(
              children: [
                TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(
                          title
                      ),
                    )
                ),

                TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                            stat, textAlign: TextAlign.right,
                          ),
                        )
                    )

              ]
            );
  }
}
