import 'dart:math';

import 'package:chinese_flashcards/animations/half_flip_animation.dart';
import 'package:chinese_flashcards/animations/slide_animation.dart';
import 'package:chinese_flashcards/components/flashcards_page/card_display.dart';
import 'package:chinese_flashcards/configs/constants.dart';
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

        onHorizontalDragEnd: (details){
          if(details.primaryVelocity! > 100){
            notifier.runSwipeCard2(direction: SlideDirection.leftAway);
            notifier.runSlideCard1();
            notifier.setIgnoreTouch(ignore: true);
            notifier.generateCurrentWord();
          }

          if(details.primaryVelocity! < -100){
            notifier.runSwipeCard2(direction: SlideDirection.rightAway);
            notifier.runSlideCard1();
            notifier.setIgnoreTouch(ignore: true);
            notifier.generateCurrentWord();
          }
        },

        child: HalfFlipAnimation(
          animate: notifier.flipCard2,
          reset: notifier.resetFlipCard2,
          flipFromHalfWay: true,
          animationCompleted: (){
            notifier.setIgnoreTouch(ignore: false);
          },
          child: SlideAnimation(
            onAnimationCompleted: (){
              notifier.resetCard2();
            },
            reset: notifier.resetSwipeCard2,
              animate:notifier.swipeCard2,
              direction: notifier.swipeDirection,
              child: Center(
                child: Container(
                  width: size.width * 0.9,
                  height: size.height * 0.70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kCircularBorderRadius),
                      border: Border.all(
                        color: Colors.white,
                        width: kCardBorderWidth
                      ),
                      color: Theme.of(context).primaryColor,
                  ),
                  child: Transform(
                    alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
                      child: const CardDisplay(isCard1: false,)
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }
}