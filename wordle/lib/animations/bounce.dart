import 'package:flutter/material.dart';

class Bounce extends StatefulWidget {
  const Bounce({
    required this.child,
    required this.animate,
    Key? key}) : super(key: key);

  final Widget child;
  final bool animate;

  @override
  _BounceState createState() => _BounceState();
}

class _BounceState extends State<Bounce> with SingleTickerProviderStateMixin{

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 200),
        vsync: this);

    _animation = TweenSequence<double>(
        [
          TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.3), weight: 1.0),
          TweenSequenceItem(tween: Tween(begin: 1.3, end: 1.0), weight: 1.0)
        ]
    ).animate(CurvedAnimation(parent: _animationController, curve: Curves.bounceInOut));

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant Bounce oldWidget) {
    // TODO: implement didUpdateWidget
    if(widget.animate){
      _animationController.reset();
      _animationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: _animation,
      child: widget.child,
    );
  }
}
