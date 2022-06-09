import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle/constants/answer_stages.dart';
import 'package:wordle/data/keys_map.dart';
import 'package:wordle/models/TileModel.dart';

class Controller extends ChangeNotifier{
  bool checkline = false;
  bool isBackOrEnter = false;
  bool gameWon = false;
  String correctWord = "";
  int currentTile = 0;
  int currentRow = 0;
  List<TileModel> tilesEntered = [];

  setCorrectWord({required String word}){
    correctWord = word;
  }

  setKeyTapped({required String value}){

    //Comprobacion de la palabra
    if(value == 'ENTER'){
      if(currentTile == 5 * (currentRow + 1)){
        isBackOrEnter = true;
        checkWord();
      }
      //Pulasamos la tecla borrar
    }else if(value == 'BACK'){
      if(currentTile > 5 * (currentRow + 1) - 5){
        isBackOrEnter = true;
        currentTile--;
        tilesEntered.removeLast();
      }
    }
    //Si pulsamos cualquier otra tecla
    else{
      if(currentTile < 5 * (currentRow + 1)){
        tilesEntered.add(TileModel(letter: value, answerStage: AnswerStage.notAnswered));
        isBackOrEnter = false;
        currentTile++;
      }
    }

    notifyListeners();
  }

  checkWord(){

    List<String> guessed = [];
    List<String> remainingCorrect = [];
    String guessedWord = "";

    for(int i = currentRow * 5; i < (currentRow * 5) + 5; i++){
      guessed.add(tilesEntered[i].letter);
    }

    guessedWord = guessed.join();
    remainingCorrect = correctWord.characters.toList();

    //Comprobamos si la palabra adivinada es correcta
    if(guessedWord == correctWord){

      for(int i = currentRow * 5; i < (currentRow * 5) + 5; i++){
        tilesEntered[i].answerStage = AnswerStage.correct;
        keysMap.update(tilesEntered[i].letter, (value) =>
        AnswerStage.correct
        );
        gameWon = true;
      }
    }else{
      //Si la palabra no es correcta, miramos cuales de las letras de la palabra
      //introducida estan correctamente en su lugar
      for(int i = 0; i < 5; i++){
        if(guessedWord[i] == correctWord[i]){
          //Aqui tenemos una letra en la posicion correcta
          //Vamos vaciando la lista de letras que quedan correctamente.
          //De manera que con cada acierto la lista se vaya vaciando
          //en esas posiciones
          remainingCorrect.remove(guessedWord[i]);
          tilesEntered[i + (currentRow * 5)].answerStage = AnswerStage.correct;
          keysMap.update(guessedWord[i], (value) => AnswerStage.correct);
        }
      }

      for(int i = 0; i < remainingCorrect.length; i++){
        for(int j = 0; j < 5; j++){
          if(remainingCorrect[i] == tilesEntered[j + (currentRow * 5)].letter){

            if(tilesEntered[j + (currentRow * 5)].answerStage != AnswerStage.correct){
              tilesEntered[j + (currentRow * 5)].answerStage = AnswerStage.contains;
            }

            final resultKey = keysMap.entries.where((element) =>
            element.key == tilesEntered[j + (currentRow * 5)].letter);

            if(resultKey.single.value != AnswerStage.correct){
              keysMap.update(resultKey.single.key, (value) => AnswerStage.contains);
            }
          }
        }
      }

      for(int i = currentRow * 5; i < (currentRow * 5) + 5; i++){
        if(tilesEntered[i].answerStage == AnswerStage.notAnswered){
          tilesEntered[i].answerStage = AnswerStage.incorrect;

          final results = keysMap.entries.
          where((element) => element.key == tilesEntered[i].letter);
          if(results.single.value == AnswerStage.notAnswered){
            keysMap.update(
                tilesEntered[i].letter, (value) => AnswerStage.incorrect);
          }
        }
      }
    }

    currentRow++;
    checkline = true;
    notifyListeners();

  }
  
}