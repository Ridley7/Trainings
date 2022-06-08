
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle/constants/words.dart';
import 'package:wordle/data/keys_map.dart';
import 'package:wordle/pages/settings.dart';
import 'package:wordle/providers/controller.dart';
import 'package:wordle/providers/theme_provider.dart';
import 'package:wordle/widgets/grid.dart';
import 'package:wordle/widgets/keyboard_row.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  late String _word;

  @override
  void initState() {
    // TODO: implement initState
    final r = Random().nextInt(words.length);
    _word = words[r];

    //Provider.of<Controller>(context, listen: false).setCorrectWord(word: _word);


    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<Controller>(context, listen: false)
          .setCorrectWord(word: _word);
    });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wordle"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Settings())
            );
          }, icon: const Icon(Icons.settings))
        ],
      ),

      body: Column(
        children: [
          const Divider(
            height: 1,
            thickness: 2,
          ),

          const Expanded(
            flex: 7,
            child: const Grid(),
          ),

          Expanded(
            flex: 4,
            child: Column(
              children: const [
                KeyboardRow(min: 1, max: 10,),
                KeyboardRow(min: 11, max: 19,),
                KeyboardRow(min: 20, max: 29,),
              ],
            ),
          )
        ],
      )

    );
  }
}



