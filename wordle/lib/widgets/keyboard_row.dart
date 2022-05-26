import 'package:flutter/material.dart';
import 'package:wordle/data/keys_map.dart';

class KeyboardRow extends StatelessWidget {
  const KeyboardRow({
    Key? key, required this.min, required this.max,
  }) : super(key: key);

  final int min, max;

  @override
  Widget build(BuildContext context) {
    int index = 0;
    return Row(
      children: keysMap.entries.map((e) {
        index++;
        if(index >= min && index <= max) {
          return Text(e.key);
        }else{
          return const SizedBox();
        }
        }).toList(),
    );
  }
}