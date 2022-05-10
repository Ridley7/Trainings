
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  //List<String> alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "\r", "\d"];
  List<String> alphabet = ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P", "A", "S", "D", "F", "G", "H", "J", "K", "L", "Ñ", "ENTER", "Z", "X", "C", "V", "B", "N", "M", "d"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WORDLE"),
      ),

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10,),

            //Grid
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  square(letter: "A",),
                  square(letter: "B",),
                  square(letter: "C",),
                  square(letter: "D",),
                  square(letter: "O",),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  square(letter: "A",),
                  square(letter: "B",),
                  square(letter: "C",),
                  square(letter: "D",),
                  square(letter: "O",),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  square(letter: "A",),
                  square(letter: "B",),
                  square(letter: "C",),
                  square(letter: "D",),
                  square(letter: "O",),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  square(letter: "A",),
                  square(letter: "B",),
                  square(letter: "C",),
                  square(letter: "D",),
                  square(letter: "O",),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  square(letter: "A",),
                  square(letter: "B",),
                  square(letter: "C",),
                  square(letter: "D",),
                  square(letter: "O",),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  square(letter: "A",),
                  square(letter: "B",),
                  square(letter: "C",),
                  square(letter: "D",),
                  square(letter: "O",),
                ],
              ),
            ),

            //Teclado del juego
            SizedBox(
              width: double.infinity,
              height: 250.0,
              child: GridView.count(
                  crossAxisCount: 10,
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
                padding: EdgeInsets.all(8.0),
                children: alphabet.map((e) {
                  return RawMaterialButton(

                      onPressed: (){
                        print(e);
                      },

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),

                    ),

                    child: Text(e,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                    ),),

                    fillColor: Colors.grey,

                  );
                }).toList()
              )
            )

          ],
        ),
      ),

    );
  }
}

class square extends StatelessWidget {

  final String letter;

  const square({Key? key, required this.letter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
        color: Colors.grey,
      ),

      child: Text(
        this.letter,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 60,

        ),
      ),
    );
  }
}
