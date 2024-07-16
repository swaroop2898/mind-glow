import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mind_glow/core/Auth_service.dart';
import 'package:mind_glow/presentaion/widget/splash_image.dart';

import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  final AuthService authService;

  const SplashScreen({super.key, required this.authService});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);

    _animationController.forward();

    Timer(const Duration(seconds: 2), navigateToNextScreen);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => LoginScreen(
                authService: widget.authService,
              )),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SplashImage(
                fadeAnimation: _fadeAnimation, screenHeight: screenHeight),
          ],
        ),
      ),
    );
  }
}
