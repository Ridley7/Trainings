import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier{
  //we use HomeController for logical part

  bool isRightDoorLock = true;

  void updateRightDoorLock(){
    isRightDoorLock = !isRightDoorLock;
    notifyListeners();
    // if you use provider then you may know this
    // it works like setState
  }
}