import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlashcardsNotifiers extends ChangeNotifier{

  String topic = "";

  setTopic({required String topic}){
    this.topic = topic;
    notifyListeners();
  }

}