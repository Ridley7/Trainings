import 'package:chinese_flashcards/providers/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlashCardsPage extends StatefulWidget {
  const FlashCardsPage({Key? key}) : super(key: key);

  @override
  State<FlashCardsPage> createState() => _FlashCardsPageState();
}

class _FlashCardsPageState extends State<FlashCardsPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardsNotifiers>(
      builder: (_, notifier, __) => Scaffold(
        appBar: AppBar(
          title: Text(
            notifier.topic
          ),
        ),
      ),
    );
  }
}
