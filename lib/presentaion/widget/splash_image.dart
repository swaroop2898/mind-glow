
import 'package:flutter/material.dart';

class SplashImage extends StatelessWidget {
  const SplashImage({
    super.key,
    required Animation<double> fadeAnimation,
    required this.screenHeight,
  }) : _fadeAnimation = fadeAnimation;

  final Animation<double> _fadeAnimation;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Image.asset(
        "asset/splash_logo.png",
        height: screenHeight * 0.2,
      ),
    );
  }
}
