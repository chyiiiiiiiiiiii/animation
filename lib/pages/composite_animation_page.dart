import 'dart:math';

import 'package:flutter/material.dart';

class CompositeAnimationPage extends StatefulWidget {
  const CompositeAnimationPage({super.key});

  @override
  State<CompositeAnimationPage> createState() => _CompositeAnimationPageState();
}

class _CompositeAnimationPageState extends State<CompositeAnimationPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<int> _sizeAnimation;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _sizeAnimation = IntTween(begin: 0, end: 200).animate(_animationController);
    _fadeAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
    _rotationAnimation =
        Tween<double>(begin: 0, end: 1).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Composite Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return FadeTransition(
              opacity: _fadeAnimation,
              child: Transform.rotate(
                angle: _rotationAnimation.value * pi * 2,
                child: Icon(
                  Icons.flutter_dash_sharp,
                  size: _sizeAnimation.value.toDouble(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
