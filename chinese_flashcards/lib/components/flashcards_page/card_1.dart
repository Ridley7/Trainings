import 'package:chinese_flashcards/animations/half_flip_animation.dart';
import 'package:chinese_flashcards/animations/slide_animation.dart';
import 'package:chinese_flashcards/enums/slide_direction.dart';
import 'package:chinese_flashcards/providers/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Card1 extends StatelessWidget {
  const Card1({
    Key? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Consumer<FlashcardsNotifiers>(
      builder: (_, notifier, __) => GestureDetector(
        onDoubleTap: (){
          notifier.runFlipCard1();
          notifier.setIgnoreTouch(ignore: true);
        },
        child: HalfFlipAnimation(
          animate: notifier.flipCard1,
          reset: notifier.resetFlipCard1,
          flipFromHalfWay: false,
          animationCompleted: (){
            notifier.resetCard1();
            notifier.runFlipCard2();
          },
          child: SlideAnimation(
            onAnimationCompleted: (){
              notifier.setIgnoreTouch(ignore: false);
            },
            reset: notifier.resetSlideCard1,
            animate: notifier.slideCard1,
              direction: SlideDirection.upIn,
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