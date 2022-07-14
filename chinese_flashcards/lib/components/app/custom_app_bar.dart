
import 'package:chinese_flashcards/pages/home_page.dart';
import 'package:chinese_flashcards/providers/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardsNotifiers>(
      builder: (_, notifier, __) => AppBar(
        actions: [
          IconButton(onPressed: (){
            notifier.reset();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false
            );
          },
              icon: const Icon(Icons.clear)
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Hero(
            tag: notifier.topic,
            child: Image.asset('assets/images/${notifier.topic}.png'),
          ),
        ),
        title: Text(
            notifier.topic
        ),
      ),
    );
  }
}
