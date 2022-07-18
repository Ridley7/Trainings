import 'package:chinese_flashcards/components/flashcards_page/tts_button.dart';
import 'package:chinese_flashcards/enums/settings.dart';
import 'package:chinese_flashcards/providers/flashcards_notifier.dart';
import 'package:chinese_flashcards/providers/settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardDisplay extends StatelessWidget {
  const CardDisplay({
    required this.isCard1,
    Key? key,
  }) : super(key: key);

  final bool isCard1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Consumer<SettingsNotifier>(
        builder: (_, notifier, __) {

          final setEnglishFirst = notifier.displayOptions.entries.firstWhere((element) =>
          element.key == Settings.englishFirst).value;

          final showPinyin = notifier.displayOptions.entries.firstWhere((element) =>
          element.key == Settings.showPinyin).value;

          final audioOnly = notifier.displayOptions.entries.firstWhere((element) =>
          element.key == Settings.audioOnly).value;

          return Consumer<FlashcardsNotifiers>(
          builder: (_, notifier, __) =>  isCard1 ? Column(
            children: [
              if(audioOnly) ... [
                TTSButton()
              ]else if(showPinyin) ... [
                buildTextBox(notifier.word1.character, context, 1),
                showPinyin ? buildTextBox(notifier.word1.pinyin, context, 1) : SizedBox(),
              ] else ... [
                buildImage(notifier.word1.english),
                buildTextBox(notifier.word1.english, context, 1),
              ]
            ],
          )
          :
          Column(
            children: [
              if(audioOnly) ... [
                buildImage(notifier.word2.english),
                buildTextBox(notifier.word2.english, context, 2),
                buildTextBox(notifier.word2.character, context, 2),
                showPinyin ? buildTextBox(notifier.word2.pinyin, context, 1) : SizedBox(),
                const TTSButton(),
              ] else if(showPinyin)...[
                buildImage(notifier.word2.english),
                buildTextBox(notifier.word2.english, context, 2),
                const TTSButton(),
              ]else ...[
                buildImage(notifier.word2.english),
                buildTextBox(notifier.word2.character, context, 2),
                showPinyin ? buildTextBox(notifier.word2.pinyin, context, 1) : SizedBox(),
              ]

            ],
          ),
        );
        },
      ),
    );
  }

  Expanded buildTextBox(String text, BuildContext context, int flex) {
    return Expanded(
      flex: flex,
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: FittedBox(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            )
        );
  }

  Expanded buildImage(String image) {
    return Expanded(
          flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
                child: Image.asset('assets/images/${image}.png')
            )
        );
  }
}