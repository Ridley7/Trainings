import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla/constanins.dart';
import 'package:tesla/home_controller.dart';

import 'components/door_lock.dart';
import 'components/tesla_bottom_navigation.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  final HomeController _controller = HomeController();

  late AnimationController _batteryAnimationController;
  late Animation<double> _animationBattery;

  void setupBatteryAnimation(){
    _batteryAnimationController = AnimationController(
        vsync: this,
      duration: Duration(milliseconds: 600)
    );

    _animationBattery = CurvedAnimation(
        parent: _batteryAnimationController,
        curve: Interval(0.0, 0.5)
    );

  }

  @override
  void initState() {
    setupBatteryAnimation();
    super.initState();
  }

  @override
  void dispose() {
    _batteryAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      // it rebuilds the widget tree when any changes happend on our controller
      //this animation need listenable
        animation: _controller,
        builder: (context, snapshot){
          return Scaffold(
            bottomNavigationBar: TeslaBottomNavigationBar(
              onTap: (index){
                _controller.onBottomNavigationTabChange(index);
              },
              selectedTab: _controller.selectedBottomTab,
            ),

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

                        AnimatedPositioned(
                          duration: defaultDuration,
                          right: _controller.selectedBottomTab == 0 ? constrains.maxWidth * 0.05
                          : constrains.maxWidth / 2,
                          child: AnimatedOpacity(
                            duration: defaultDuration,
                            opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                            child: DoorLock(
                              isLock: _controller.isRightDoorLock,
                              press: _controller.updateRightDoorLock,
                            ),
                          ),
                        ),

                        AnimatedPositioned(
                          duration: defaultDuration,
                          left: _controller.selectedBottomTab == 0 ? constrains.maxWidth * 0.05
                          : constrains.maxWidth / 2,
                          child: AnimatedOpacity(
                            duration: defaultDuration,
                            opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                            child: DoorLock(
                              isLock: _controller.isLeftDoorLock,
                              press: _controller.updateLeftDoorLock,
                            ),
                          ),
                        ),

                        AnimatedPositioned(
                          duration: defaultDuration,
                          top: _controller.selectedBottomTab == 0 ? constrains.maxHeight * 0.13
                          : constrains.maxHeight / 2,
                          child: AnimatedOpacity(
                            duration: defaultDuration,
                            opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                            child: DoorLock(
                              isLock: _controller.isBonnetLock,
                              press: _controller.updateBonnetDoorLock,
                            ),
                          ),
                        ),

                        AnimatedPositioned(
                          duration: defaultDuration,
                          bottom: _controller.selectedBottomTab == 0 ? constrains.maxHeight * 0.17
                          : constrains.maxHeight / 2,
                          child: AnimatedOpacity(
                            duration: defaultDuration,
                            opacity: _controller.selectedBottomTab == 0 ? 1 : 0,
                            child: DoorLock(
                              isLock: _controller.isTrunkLock,
                              press: _controller.updateTrunkDoorLock,
                            ),
                          ),
                        ),
                        
                        SvgPicture.asset(
                          "assets/icons/Battery.svg",
                          width: constrains.maxWidth * 0.45,
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


