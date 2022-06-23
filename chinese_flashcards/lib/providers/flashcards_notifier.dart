import 'dart:math';

import 'package:chinese_flashcards/configs/constants.dart';
import 'package:chinese_flashcards/enums/slide_direction.dart';
import 'package:chinese_flashcards/models/word.dart';
import 'package:flutter/material.dart';

import '../data/words.dart';

class FlashcardsNotifiers extends ChangeNotifier{

  String topic = "";
  Word word1 = Word(topic: "", english: "", character: "", pinyin: "");
  Word word2 = Word(topic: "", english: "", character: "", pinyin: "");
  List<Word> selectedWords = [];

  setTopic({required String topic}){
    this.topic = topic;
    notifyListeners();
  }

  generateCurrentWord(){

    if(selectedWords.isNotEmpty){
      final r = Random().nextInt(selectedWords.length);
      word1 = selectedWords[r];
      selectedWords.removeAt(r);
    }else{
      print('All words selected');
    }
    
    Future.delayed(const Duration(milliseconds: kSlideAwayDuration), (){
      word2 = word1;
    });
  }

  generateAllSelectedWords(){
    selectedWords.clear();
    selectedWords = words.where((element) => element.topic == topic).toList();
  }

  //Codigo para las animaciones
  
  bool flipCard1 = false;
  bool slideCard1 = false;
  bool resetSlideCard1 = false;
  bool resetFlipCard1 = false;

  bool flipCard2 = false;
  bool swipeCard2 = false;
  bool resetFlipCard2 = false;
  bool resetSwipeCard2 = false;

  bool ignoreTouches = true;
  SlideDirection swipeDirection = SlideDirection.none;

  setIgnoreTouch({required bool ignore}){
    ignoreTouches = ignore;
    notifyListeners();
  }


  runSlideCard1(){
    slideCard1 = true;
    resetSlideCard1 = false;
    notifyListeners();
  }

  runFlipCard1(){
    flipCard1 = true;
    resetFlipCard1 = false;
    notifyListeners();
  }

  runFlipCard2(){
    flipCard2 = true;
    resetFlipCard2 = false;
    notifyListeners();
  }

  runSwipeCard2({required SlideDirection direction}){
    swipeDirection = direction;
    swipeCard2 = true;
    resetSwipeCard2 = false;
    notifyListeners();
  }

  resetCard1(){
    resetSlideCard1 = true;
    resetFlipCard1 = true;
    slideCard1 = false;
    flipCard1 = false;
  }

  resetCard2(){
    resetSwipeCard2 = true;
    resetFlipCard2 = true;
    swipeCard2 = false;
    flipCard2 = false;
  }
}