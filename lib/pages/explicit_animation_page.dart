import 'package:flutter/material.dart';

class ExplicitAnimationPage extends StatefulWidget {
  const ExplicitAnimationPage({super.key});

  @override
  State<ExplicitAnimationPage> createState() => _ExplicitAnimationPageState();
}

class _ExplicitAnimationPageState extends State<ExplicitAnimationPage>
    with SingleTickerProviderStateMixin {
  // 使用late final保證AnimationController等一下會擁有實體
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    // 在元件第一次創建時初始化AnimationController，並設置Duration運行時間為1秒
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    // 在元件脫離Widget Tree後，釋放資源
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explicit Animation'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            final size = 200 * _animationController.value;

            return Icon(
              Icons.flutter_dash,
              size: size,
              color: Colors.blue,
            );
          },
        ),
      ),
    );
  }
}
