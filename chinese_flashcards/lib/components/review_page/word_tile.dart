import 'package:chinese_flashcards/models/word.dart';
import 'package:flutter/material.dart';

class WordTile extends StatelessWidget {
  WordTile({
    required this.animation,
    required this.word,
    this.callback,
    required this.index,
    Key? key,
  }) : super(key: key);

  final Animation animation;
  final Word word;
  final VoidCallback? callback;
  final int index;

  final _tweenOffsetLeft = Tween<Offset>(begin: const Offset(-1, 0), end: const Offset(0, 0));
  final _tweenOffsetRight = Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0));

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation.drive(CurveTween(curve: Curves.easeInOutSine)).drive(
        index % 2 == 0 ? _tweenOffsetRight : _tweenOffsetLeft
      ),
      child: ListTile(
        title: Text(word.english),
        trailing: IconButton(icon: Icon(Icons.clear), onPressed: (){
          callback?.call();
        },),
      ),
    );
  }
}

