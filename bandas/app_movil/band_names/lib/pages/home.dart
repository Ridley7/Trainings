import 'dart:io';

import 'package:band_names/models/Band.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Band> bands = [
    Band(id: "1", name: "Metallica", votes: 1),
    Band(id: "2", name: "Led Zeppelin", votes: 2),
    Band(id: "3", name: "Queen", votes: 3),
    Band(id: "4", name: "Beatles", votes: 5),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Band Names",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),

      body: ListView.builder(
        itemCount: bands.length,
          itemBuilder: (BuildContext context, int index){
            return bandTile(bands[index]);
          }
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 1,
        onPressed: addNewBand
      ),

    );
  }

  Widget bandTile(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (DismissDirection direction){
        
      },
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("Delete Band", style: TextStyle(color: Colors.white),),
        ),
      ),
      child: ListTile(
              leading: CircleAvatar(
                child: Text(band.name.substring(0,2)),
                backgroundColor: Colors.blue[100],
              ),
        title: Text(band.name),
        trailing: Text('${ band.votes}', style: TextStyle(fontSize: 20),),
        onTap: (){

        },
            ),
    );
  }

  addNewBand(){

    final textEditingController = new TextEditingController();

    if(!Platform.isAndroid){
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("New band name:"),
              content: TextField(
                controller: textEditingController,
              ),
              actions: [
                MaterialButton(
                    child: Text("Add"),
                    elevation: 5,
                    textColor: Colors.blue,
                    onPressed: () => addBandToList(textEditingController.text)
                )
              ],
            );
          }
      );
    }

    showCupertinoDialog(
      context: context,
      builder: ( _ ) {
        return CupertinoAlertDialog(
          title: Text("Add new band"),
          content: CupertinoTextField(
            controller: textEditingController,
          ),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
                child: Text("Add"),
              onPressed: () => addBandToList(textEditingController.text),
            ),

            CupertinoDialogAction(
              isDestructiveAction: true,
              child: Text("Dismiss"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      }
    );

  }

  void addBandToList(String name){

    if(name.length > 1){
      this.bands.add(new Band(id: DateTime.now().toString(), name: name, votes: 0));
      setState(() {
        
      });
    }

    Navigator.pop(context);
  }

}
