import 'package:chinese_flashcards/configs/constants.dart';
import 'package:chinese_flashcards/providers/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

class TTSButton extends StatefulWidget {
  const TTSButton({Key? key}) : super(key: key);

  @override
  State<TTSButton> createState() => _TTSButtonState();
}

class _TTSButtonState extends State<TTSButton> {

  bool _isTapped = false;
  final FlutterTts _tts = FlutterTts();

  @override
  void initState() {
    // TODO: implement initState
    _setupTts();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardsNotifiers>(
      builder: (_, notifier, __) {
        return Expanded(
          child: IconButton(
            onPressed: (){
              _isTapped = true;
              _runTts(text: notifier.word1.character);
              setState((){});
              Future.delayed(Duration(milliseconds: 500), (){
                _isTapped = false;
                setState((){});
              });
            },
            icon: Icon(Icons.audiotrack, size: 50, color: _isTapped ? kYellow : Colors.white,),
          )
      );
      },
    );
  }

  _setupTts() async{
    await _tts.setLanguage("zn-Cn");
    await _tts.setSpeechRate(0.40);
  }

  _runTts({required String text}) async{
    await _tts.speak(text);
  }
}
