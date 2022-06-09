import 'package:flutter/material.dart';
import 'package:wordle/widgets/stats_tile.dart';

class StatsBox extends StatelessWidget {
  const StatsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IconButton(
            alignment: Alignment.centerRight,
              onPressed: (){},
              icon: Icon(Icons.clear)
          ),

          Expanded(child: Text('STATISTICS', textAlign: TextAlign.center,)),
          Expanded(
            child: Row(
              children: const [
                StatsTile(heading: "Played", value: 50,),
                StatsTile(heading: "Win %", value: 90,),
                StatsTile(heading: "Current\nStreak", value: 12,),
                StatsTile(heading: "Max\nStreak", value: 15,),
              ],
            ),
          )
        ],
      ),
    );
  }
}

