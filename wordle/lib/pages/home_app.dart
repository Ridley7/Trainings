
import 'package:flutter/material.dart';
import 'package:wordle/data/keys_map.dart';
import 'package:wordle/widgets/grid.dart';
import 'package:wordle/widgets/keyboard_row.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wordle"),
        centerTitle: true,
        elevation: 0,
      ),

      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              color: Colors.yellow,
              child: const Grid(),
            ),
          ),

          Expanded(
            flex: 4,
            child: Container(
              color: Colors.green,
              child: Column(
                children: const [
                  KeyboardRow(min: 1, max: 10,),
                  KeyboardRow(min: 11, max: 19,),
                  KeyboardRow(min: 20, max: 29,),
                ],
              ),
            ),
          )
        ],
      )

    );
  }
}



