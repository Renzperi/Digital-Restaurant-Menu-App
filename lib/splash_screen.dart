import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _startFadeEffect();
    Timer(const Duration(seconds: 7), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  void _startFadeEffect() {
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xfff0256b), Color(0xffff9a68)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: AnimatedOpacity(
            opacity: _opacity,
            duration: const Duration(seconds: 2),
            child: Image.asset(
              'assets/images/Logo.png',
              width: 900.0, // Adjust the width as needed
              height: 900.0, // Adjust the height as needed
            ),
          ),
        ),
      ),
    );
  }
}
