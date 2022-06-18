import 'package:chinese_flashcards/pages/flashcards_page.dart';
import 'package:chinese_flashcards/providers/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

loadSession({required BuildContext context, required String topic}){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FlashCardsPage()));
  Provider.of<FlashcardsNotifiers>(context, listen: false).setTopic(topic: topic);
}