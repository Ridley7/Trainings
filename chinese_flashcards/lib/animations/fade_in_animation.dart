import 'package:flutter/material.dart';

class FadeInAnimation extends StatefulWidget {
  const FadeInAnimation({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  State<FadeInAnimation> createState() => _FadeInAnimationState();
}

class _FadeInAnimationState extends State<FadeInAnimation> with SingleTickerProviderStateMixin{

  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this,
      duration: const Duration(milliseconds: 1000)
    );
    super.initState();

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOutSine)
    );

    _opacityAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOutSine)
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Opacity(
            opacity: _opacityAnimation.value,
          child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
            ..scale(_scaleAnimation.value),
            child: widget.child,
          ),
        )
    );
  }
}