import 'dart:io';

import 'package:band_names/models/Band.dart';
import 'package:band_names/providers/socket_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Band> bands = [
  ];

  @override
  void initState() {

    final socketProvider = Provider.of<SocketProvider>(context, listen: false);

    //Nos suscribimos al evento que queremos escuchar
    /* Este metodo se sustituye por _handleActiveBands. El metodo se _handleActiveBands
    se pasa por referencia, por lo tanto la variable payload va implicita
    socketProvider.socket.on('active-bands', ( payload ) {
      this.bands = (payload as List).map((band) => Band.fromJson(band)).toList();
      setState(() {});
    });
     */
    socketProvider.socket.on('active-bands', _handleActiveBands);
    super.initState();
  }

  _handleActiveBands( dynamic payload){

    this.bands = (payload as List).map((band) => Band.fromJson(band)).toList();
    setState(() {
    });
  }

  @override
  void dispose() {

    final socketProvider = Provider.of<SocketProvider>(context, listen: false);
    socketProvider.socket.off('active-bands');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final socketProvider = Provider.of<SocketProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Band Names",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child:
            socketProvider.serverStatus == ServerStatus.Online
            ?
            Icon(
              Icons.check_circle, color: Colors.blue[300],
            )
            :
            Icon(
              Icons.offline_bolt, color: Colors.red,
            )
            ,
          )
        ],
      ),

      body: Column(
        children: [

          _showGraph(),

          Expanded(
              child: ListView.builder(
                  itemCount: bands.length,
                  itemBuilder: (BuildContext context, int index){
                    return bandTile(bands[index]);
                  }
              ))
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 1,
        onPressed: addNewBand
      ),

    );
  }

  Widget bandTile(Band band) {

    final socketService = Provider.of<SocketProvider>(context, listen: false);

    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (DismissDirection direction) => socketService.emit('delete-band', {'id': band.id}),
      background: Container(
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text("Delete Band Name", style: TextStyle(color: Colors.white),),
        ),
      ),
      child: ListTile(
              leading: CircleAvatar(
                child: Text(band.name.substring(0,2)),
                backgroundColor: Colors.blue[100],
              ),
        title: Text(band.name),
        trailing: Text('${ band.votes}', style: TextStyle(fontSize: 20),),
        onTap: () =>
                //Enviamos id de la banda por la que queremos votar
          socketService.socket.emit('vote-band', { 'id': band.id}),
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

      final socketService = Provider.of<SocketProvider>(context, listen: false);

      socketService.emit('add-band', {'name':name});
    }

    Navigator.pop(context);
  }

  Widget _showGraph(){
    Map<String, double> dataMap = new Map();

    bands.forEach((band) {
      dataMap.putIfAbsent(band.name, () => band.votes.toDouble());
    });

    final List<Color> colorList = [
      Colors.blue,
      Colors.amberAccent,
      Colors.pink,
      Colors.deepPurpleAccent,
      Colors.greenAccent
    ];

    return Container(
      width: double.infinity,
      height: 200,
      child: PieChart(
        dataMap: dataMap,
        animationDuration: Duration(milliseconds: 800),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 3.2,
        colorList: colorList,
        initialAngleInDegree: 0,
        chartType: ChartType.ring,
        ringStrokeWidth: 32,
        centerText: "Bands",
        legendOptions: LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.right,
          showLegends: true,
          //legendShape: _BoxShape.circle,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        chartValuesOptions: ChartValuesOptions(
          showChartValueBackground: true,
          showChartValues: true,
          showChartValuesInPercentage: false,
          showChartValuesOutside: false,
          decimalPlaces: 1,
        ),
        // gradientList: ---To add gradient colors---
        // emptyColorGradient: ---Empty Color gradient---
      ),
    );
  }

}
