import 'package:chinese_flashcards/animations/half_flip_animation.dart';
import 'package:chinese_flashcards/animations/slide_animation.dart';
import 'package:chinese_flashcards/enums/slide_direction.dart';
import 'package:chinese_flashcards/providers/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Card2 extends StatelessWidget {
  const Card2({
    Key? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Consumer<FlashcardsNotifiers>(
      builder: (_, notifier, __) => GestureDetector(
        child: HalfFlipAnimation(
          animate: notifier.flipCard2,
          reset: false,
          flipFromHalfWay: true,
          animationCompleted: (){

          },
          child: SlideAnimation(
              direction: SlideDirection.upIn  ,
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
      ),
    );
  }
}