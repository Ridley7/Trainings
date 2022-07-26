import 'package:chinese_flashcards/configs/constants.dart';
import 'package:chinese_flashcards/providers/flashcards_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double beginValue = 0.0;
  double endValue = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
        vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Selector<FlashcardsNotifiers, double>(
      selector: (_, notifier) => notifier.percentComplete,
      builder: (_, percentComplete, __){
        endValue = percentComplete;
        if(endValue == 0){
          beginValue = 0;
        }
        var animation = Tween<double>(begin: beginValue, end: endValue)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOutCirc));

        _controller.reset();
        _controller.forward();
        beginValue = endValue;

        return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => Padding(
                padding: EdgeInsets.all(size.width * 0.05),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kCircularBorderRadius),
                child: LinearProgressIndicator(
                  minHeight: size.height * 0.03,
                  value: animation.value,
                ),
              ),
            )
        );

      },
    );
  }
}
