
import 'dart:math';

import 'package:chinese_flashcards/components/flashcards_page/results_box.dart';
import 'package:chinese_flashcards/configs/constants.dart';
import 'package:chinese_flashcards/enums/slide_direction.dart';
import 'package:chinese_flashcards/models/word.dart';
import 'package:flutter/material.dart';

import '../data/words.dart';

class FlashcardsNotifiers extends ChangeNotifier{

  List<Word> incorrectCards = [];

  String topic = "";
  Word word1 = Word(topic: "", english: "Loading Arrows", character: "", pinyin: "");
  Word word2 = Word(topic: "", english: "Loading Arrows", character: "", pinyin: "");
  List<Word> selectedWords = [];

  bool isFirstRound = true;
  bool isRoundCompleted = false;
  bool isSessionCompleted = false;

  reset(){
    isFirstRound = true;
    isRoundCompleted = false;
    isSessionCompleted = false;
  }

  setTopic({required String topic}){
    this.topic = topic;
    notifyListeners();
  }

  generateCurrentWord({required BuildContext context}){

    if(selectedWords.isNotEmpty){
      final r = Random().nextInt(selectedWords.length);
      word1 = selectedWords[r];
      selectedWords.removeAt(r);
    }else{
      if(incorrectCards.isEmpty){
        isSessionCompleted = true;
      }
      isFirstRound = false;
      isRoundCompleted = true;
      Future.delayed(const Duration(milliseconds: 500),(){
        showDialog(context: context, builder: (context) => const ResultsBox());
      });
    }
    
    Future.delayed(const Duration(milliseconds: kSlideAwayDuration), (){
      word2 = word1;
    });
  }

  updateCardOutcome({required Word word, required bool isCorrect}){
    if(!isCorrect){
      incorrectCards.add(word);
    }

    incorrectCards.forEach((element) => print(element.english));

    notifyListeners();
  }

  generateAllSelectedWords(){
    selectedWords.clear();
    isRoundCompleted = false;
    if(isFirstRound){
      selectedWords = words.where((element) => element.topic == topic).toList();
    }else{
      selectedWords = incorrectCards.toList();
      incorrectCards.clear();
    }

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
    updateCardOutcome(word: word2, isCorrect: direction == SlideDirection.leftAway);
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