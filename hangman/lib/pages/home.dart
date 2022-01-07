import 'package:flutter/material.dart';
import 'package:hangman/game/game.dart';
import 'package:hangman/ui/colors.dart';
import 'package:hangman/widgets/figure_image.dart';
import 'package:hangman/widgets/letter.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  //Palabra a adivinar
  String word = "flutter".toUpperCase();
  //Letras del Alfabeto
  List<String> alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      appBar: AppBar(
        title: Text("Hangman"),
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                figureImage(Game.tries >= 0, "assets/hang.png"),
                figureImage(Game.tries >= 1, "assets/head.png"),
                figureImage(Game.tries >= 2, "assets/body.png"),
                figureImage(Game.tries >= 3, "assets/ra.png"),
                figureImage(Game.tries >= 4, "assets/la.png"),
                figureImage(Game.tries >= 5, "assets/rl.png"),
                figureImage(Game.tries >= 6, "assets/ll.png"),
              ],
            ),
          ),

          SizedBox(
            height: 20,
          ),

          //Representacion de la palabra
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: word.split('').map((e) => letter(e.toUpperCase(), !Game.selectedChar.contains(e.toUpperCase()))).toList(),
          ),

          //Teclado del juego
          SizedBox(
            width: double.infinity,
            height: 250.0,
            child: GridView.count(
                crossAxisCount: 7,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: EdgeInsets.all(8.0),
              children: alphabet.map((e) {
                return RawMaterialButton(
                    onPressed: Game.selectedChar.contains(e)
                    ? null
                    : () {
                      setState(() {
                        Game.selectedChar.add(e);
                        if(!word.split('').contains(e.toUpperCase())){
                          Game.tries++;
                        }
                      });
                    },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),

                    child: Text(e,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                    ),),

                  fillColor: Game.selectedChar.contains(e)
                    ? Colors.black87
                      : AppColor.primaryColorDark

                );
              }).toList(),
            ),
          )

        ],
      ),

    );
  }
}
