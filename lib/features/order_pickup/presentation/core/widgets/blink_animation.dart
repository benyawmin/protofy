import 'package:flutter/material.dart';

//! Any widget passed to this widget will blink
class BlinkAnimation extends StatefulWidget {
  final Widget child;

  const BlinkAnimation({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<BlinkAnimation> createState() => _BlinkAnimationState();
}

class _BlinkAnimationState extends State<BlinkAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> animation = CurvedAnimation(
    parent: controller,
    curve: Curves.easeIn,
  );

  @override
  Widget build(BuildContext context) {
    // Fade in and out
    return FadeTransition(opacity: animation, child: widget.child);
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }
}
