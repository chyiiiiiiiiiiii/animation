import 'package:animation/pages/animated_widget_page.dart';
import 'package:animation/pages/composite_animation_page.dart';
import 'package:animation/pages/custom_tween_page.dart';
import 'package:animation/pages/explicit_animation_page.dart';
import 'package:animation/pages/implicit_animation_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListView(
        children: [
          ListTile(
            title: const Text('Explicit Animation'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ExplicitAnimationPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Implicit Animation'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ImplicitAnimationPage(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Custom Tween'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustomTweenPage()));
            },
          ),
          ListTile(
            title: const Text('Composite Animation'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CompositeAnimationPage()));
            },
          ),
          ListTile(
            title: const Text('Animated Widget'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AnimatedWidgetPage()));
            },
          ),
        ],
      );
}
