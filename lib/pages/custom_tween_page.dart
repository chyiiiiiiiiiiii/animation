import 'package:flutter/material.dart';

class CustomTweenPage extends StatefulWidget {
  const CustomTweenPage({
    super.key,
  });

  @override
  State<CustomTweenPage> createState() => _CustomTweenPageState();
}

class _CustomTweenPageState extends State<CustomTweenPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<String> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = TypingTween(
      begin: '',
      end: 'Hello World! This is a typing animation.',
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Tween'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Text(
                    _animation.value,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_controller.status == AnimationStatus.completed) {
                    _controller.reverse();
                  } else {
                    _controller.forward();
                  }
                },
                child: const Text('Animate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TypingTween extends Tween<String> {
  TypingTween({
    String super.begin = '',
    super.end,
  });

  @override
  String lerp(double t) {
    final endStringLength = end?.length ?? 0;
    final cutPosition = (endStringLength * t).round();
    final displayedText = end?.substring(0, cutPosition) ?? '';

    return displayedText;
  }
}
