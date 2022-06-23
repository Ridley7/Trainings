import 'package:chinese_flashcards/animations/fade_in_animation.dart';
import 'package:chinese_flashcards/configs/constants.dart';
import 'package:chinese_flashcards/utils/methods.dart';
import 'package:flutter/material.dart';

class TopicTile extends StatelessWidget {
  const TopicTile({
    Key? key,
    required this.topic,
  }) :  super(key: key);

  final String topic;

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      child: GestureDetector(
        onTap: (){
          loadSession(context: context, topic: topic);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(kCircularBorderRadius),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Hero(
                      tag: topic,
                        child: Image.asset('assets/images/$topic.png')),
                  ),
              ),

              Expanded(
                  child: Text(topic)
              )
            ],
          ),
        ),
      ),
    );
  }
}