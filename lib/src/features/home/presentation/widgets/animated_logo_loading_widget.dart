import 'package:flutter/material.dart';

class AnimatedLogoLoadingWidget extends StatefulWidget {
  const AnimatedLogoLoadingWidget({super.key});

  @override
  AnimatedLogoLoadingWidgetState createState() =>
      AnimatedLogoLoadingWidgetState();
}

class AnimatedLogoLoadingWidgetState extends State<AnimatedLogoLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (BuildContext context, Widget? child) {
            return Transform.scale(
              scale: _animation.value,
              child: Image.asset(
                'assets/images/logo.png',
                scale: 1,
              ),
            );
          },
        ),
      ),
    );
  }
}
