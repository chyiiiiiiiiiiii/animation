import 'package:flutter/material.dart';

class ImplicitAnimationPage extends StatefulWidget {
  const ImplicitAnimationPage({super.key});

  @override
  State<ImplicitAnimationPage> createState() => _ImplicitAnimationPageState();
}

class _ImplicitAnimationPageState extends State<ImplicitAnimationPage>
    with SingleTickerProviderStateMixin {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Implicit Animation'),
      ),
      body: AnimatedSlide(
        // 根據isSelected狀態決定位移量
        offset: isSelected ? const Offset(2, 4) : const Offset(1, 1), // 位置資訊
        duration: const Duration(seconds: 2), // 動畫持續時間為2秒
        child: IconButton(
          // 點擊按鈕時觸發狀態改變
          onPressed: () {
            setState(() {
              isSelected = !isSelected; // 切換選中狀態
            });
          },
          // 根據選中狀態顯示不同的圖標
          icon: isSelected
              ? const Icon(Icons.favorite) // 選中時顯示實心愛心
              : const Icon(Icons.favorite_border), // 未選中時顯示空心愛心
          color: Colors.red, // 圖標顏色為紅色
          iconSize: 100, // 圖標大小為100
        ),
      ),
    );
  }
}
