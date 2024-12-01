import 'package:flutter/material.dart';

class AnimatedWidgetPage extends StatefulWidget {
  const AnimatedWidgetPage({super.key});

  @override
  State<AnimatedWidgetPage> createState() => _AnimatedWidgetPageState();
}

class _AnimatedWidgetPageState extends State<AnimatedWidgetPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Animated Widget'),
        ),
        body: MoveRightTransition(
          animation: _controller,
          child: const Icon(
            Icons.star,
            size: 200,
          ),
        ),
      );
}

class MoveRightTransition extends AnimatedWidget {
  const MoveRightTransition({
    required Animation<double> animation,
    required this.child,
    super.key,
  }) : super(listenable: animation);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;

    return AnimatedBuilder(
      animation: listenable,
      child: FittedBox(child: child),
      builder: (context, child) {
        final x = 200 * animation.value;

        return Transform.translate(
          offset: Offset(x, 0),
          child: child,
        );
      },
    );
  }
}
