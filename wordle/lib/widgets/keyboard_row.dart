import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordle/constants/answer_stages.dart';
import 'package:wordle/constants/colors.dart';
import 'package:wordle/data/keys_map.dart';
import 'package:wordle/providers/controller.dart';
import 'package:wordle/widgets/tile.dart';

class KeyboardRow extends StatelessWidget {
  const KeyboardRow({
    Key? key, required this.min, required this.max,
  }) : super(key: key);

  final int min, max;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<Controller>(
      builder: (_, notifier, __) {
        int index = 0;
        return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: keysMap.entries.map((e) {
          index++;
          if(index >= min && index <= max) {
            Color color = Theme.of(context).primaryColorLight;
            //Color color = Colors.grey;
            Color keyColor = Colors.white;
            if(e.value == AnswerStage.correct){
              color = correctGreen;
            }else if(e.value == AnswerStage.contains){
              color = containsYellow;
            }else if(e.value == AnswerStage.incorrect){
              color = Theme.of(context).primaryColorDark;
              print("Esto esincorrecto");
            }else{
                keyColor = Theme.of(context).textTheme.bodyText2?.color ?? Colors.black;
            }

            return Padding(
            padding: EdgeInsets.all(size.width * 0.006),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: SizedBox(
                    width: e.key == 'ENTER' || e.key == 'BACK' ?
                    size.width * 0.13 :
                    size.width * 0.085,
                    height: size.height * 0.090,
                    child: Material(
                      color: color,
                      child: InkWell(
                        onTap: (){
                          Provider.of<Controller>(context, listen:false).setKeyTapped(value: e.key);
                        },
                        child: Center(
                          child: e.key == 'BACK' ? Icon(Icons.backspace_outlined) :
                          Text(
                            e.key,
                          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            color: keyColor
                          ),),
                      ),
                    )
                ),
              ),
            ));
          }else{
            return const SizedBox();
          }
          }).toList(),
      );
      },
    );
  }
}

