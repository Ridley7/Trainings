import 'package:flutter/material.dart';
import 'package:houses/utils/constants.dart';
import 'package:houses/utils/widget_functions.dart';

class OptionButton extends StatelessWidget {
  
  final String text;
  final IconData icon;

  const OptionButton({Key? key, required this.text, required this.icon}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return TextButton(
        onPressed: (){},
        style: TextButton.styleFrom(
          textStyle: TextStyle(fontSize: 20),
              backgroundColor: COLOR_DARK_BLUE,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15)
        ),
        child: Row(
          children: [
            Icon(icon, color: COLOR_WHITE,),
            addHorizontalSpace(10),
            Text(
              text,
              style: TextStyle(
                color: COLOR_WHITE
              )
            )
          ],
        )
    );
  }
}
