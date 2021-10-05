import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla/constanins.dart';
import 'package:tesla/home_controller.dart';

import 'components/door_lock.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      // it rebuilds the widget tree when any changes happend on our controller
      //this animation need listenable
        animation: _controller,
        builder: (context, snapshot){
          return Scaffold(
            body: SafeArea(
                child: LayoutBuilder(
                  builder: (context, constrains){
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: constrains.maxHeight * 0.1
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/Car.svg",
                            width: double.infinity,
                          ),
                        ),

                        Positioned(
                          right: constrains.maxWidth * 0.05,
                          child: DoorLock(
                            isLock: _controller.isRightDoorLock,
                            press: _controller.updateRightDoorLock,
                          ),
                        )
                      ],
                    );
                  },
                )
            ),
          );
        }
    );
  }
}


