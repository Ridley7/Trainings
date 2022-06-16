import 'package:flutter/material.dart';

class TopicTile extends StatelessWidget {
  const TopicTile({
    Key? key,
    required this.topic,
  }) :  super(key: key);

  final String topic;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
              child: Text('images')
          ),
          
          Expanded(
              child: Text(topic)
          )
        ],
      ),
    );
  }
}