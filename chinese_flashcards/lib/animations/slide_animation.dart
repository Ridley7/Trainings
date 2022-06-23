import 'package:chinese_flashcards/configs/constants.dart';
import 'package:chinese_flashcards/enums/slide_direction.dart';
import 'package:flutter/material.dart';

class SlideAnimation extends StatefulWidget {
  const SlideAnimation({
    required this.child,
    required this.direction,
    this.animate = true,
    this.reset,
    this.onAnimationCompleted,
    Key? key}) : super(key: key);

  final Widget child;
  final SlideDirection direction;
  final bool animate;
  final bool? reset;
  final VoidCallback? onAnimationCompleted;

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation> with SingleTickerProviderStateMixin{

  late final AnimationController _animationController;
  late final Animation<Offset> _animation;

  @override
  void initState() {

    _animationController = AnimationController(
        vsync: this,
      duration: const Duration(milliseconds: kSlideAwayDuration)
    )..addListener(() {
      if(_animationController.isCompleted){
        widget.onAnimationCompleted?.call();
      }
    });

    if(widget.animate){
      _animationController.forward();
    }

    super.initState();
  }

  @override
  void didUpdateWidget(covariant SlideAnimation oldWidget) {

    if(widget.reset == true){
      _animationController.reset();
    }

    if(widget.animate){
      _animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    late final Animation<Offset> _animation;
    Tween<Offset> tween;

    switch(widget.direction){

      case SlideDirection.leftAway:
        tween = Tween<Offset>(begin: const Offset(0,0), end: const Offset(-1, 0));
        break;

      case SlideDirection.rightAway:
        tween = Tween<Offset>(begin: const Offset(0,0), end: const Offset(1, 0));
        break;

      case SlideDirection.leftIn:
        tween = Tween<Offset>(begin: const Offset(-1,0), end: const Offset(0, 0));
        break;

      case SlideDirection.rightIn:
        tween = Tween<Offset>(begin: const Offset(1,0), end: const Offset(0, 0));
        break;

      case SlideDirection.upIn:
        tween = Tween<Offset>(begin: const Offset(0,1), end: const Offset(0, 0));
        break;

      case SlideDirection.none:
        tween = Tween<Offset>(begin: const Offset(0,0), end: const Offset(0, 0));
        break;
    }

    _animation = tween.animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    return SlideTransition(position: _animation,
    child: widget.child,
    );
  }
}

