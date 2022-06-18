import 'package:chinese_flashcards/animations/slide_animation.dart';
import 'package:chinese_flashcards/components/app/custom_app_bar.dart';
import 'package:chinese_flashcards/enums/slide_direction.dart';
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

    final size = MediaQuery.of(context).size;

    return Consumer<FlashcardsNotifiers>(
      builder: (_, notifier, __) => Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: CustomAppBar()
        ),

        body: SlideAnimation(
            direction: SlideDirection.leftIn,
            child: Center(
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.70,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor
                ),
              ),
            )
        ),
      ),
    );
  }
}
