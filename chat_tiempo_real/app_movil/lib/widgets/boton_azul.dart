import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {

  final String text;
  final Function() callback;

  const BotonAzul({Key? key, required this.text, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: callback,
      elevation: 2,
      highlightElevation: 5,
      color: Colors.blue,
      shape: StadiumBorder(),
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(this.text, style: TextStyle(
              fontSize: 18,
              color: Colors.white
          ),),
        ),
      ),
    );
  }
}
