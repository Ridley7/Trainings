
import 'package:chinese_flashcards/enums/language_type.dart';
import 'package:chinese_flashcards/providers/language_button_notifier.dart';
import 'package:chinese_flashcards/utils/methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({
    Key? key,
    required this.languageType
  }) : super(key: key);

  final LanguageType languageType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor
          ),
          onPressed: (){

            Provider.of<LanguageButtonNotifier>(context, listen: false).updateShowLanguage(languageType: languageType);
          },
          child: Text(languageType.toSymbol()),
        )
    );
  }
}

