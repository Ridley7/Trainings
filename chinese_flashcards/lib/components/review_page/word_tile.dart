import 'package:chinese_flashcards/components/app/tts_button.dart';
import 'package:chinese_flashcards/models/word.dart';
import 'package:chinese_flashcards/providers/language_button_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
        child: Consumer<LanguageButtonNotifier>(
          builder: (_, notifier, __) => ListTile(
            leading: notifier.showImage ? SizedBox(
              width: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/${word.english}.png'),
              ),
            )
            :
            const SizedBox(),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                notifier.showEnglish ? Text(word.english) : const SizedBox(),
                notifier.showCharacter ? Text(word.character) : const SizedBox(),
                notifier.showPinyin ? Text(word.pinyin) : const SizedBox(),
              ],
            ),
            trailing: SizedBox(
              width: 80,
              child: Row(
                children: [
                  TTSButton(word: word, iconSize: 25,),
                  Expanded(
                    child: IconButton(icon: Icon(Icons.clear), onPressed: (){
                      callback?.call();
                    },),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

