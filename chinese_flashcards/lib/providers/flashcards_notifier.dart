import 'package:chinese_flashcards/enums/slide_direction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlashcardsNotifiers extends ChangeNotifier{

  String topic = "";

  setTopic({required String topic}){
    this.topic = topic;
    notifyListeners();
  }

  bool flipCard1 = false;

  runFlipCard1(){
    flipCard1 = true;
    notifyListeners();
  }

  bool flipCard2 = false;

  runFlipCard2(){
    flipCard2 = true;
    notifyListeners();
  }

  bool swipeCard2 = false;
  SlideDirection swipeDirection = SlideDirection.none;

  runSwipeCard2({required SlideDirection direction}){
    swipeDirection = direction;
    swipeCard2 = true;
    notifyListeners();
  }

}