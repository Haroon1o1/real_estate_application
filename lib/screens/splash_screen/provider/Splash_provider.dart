import 'package:flutter/material.dart';

class SplashProvider with ChangeNotifier {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  Animation<Offset> get slideAnimation => _slideAnimation;

  void initAnimation(TickerProvider vsync) {
    _controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 1200),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1), // start off-screen bottom
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();
  }

  void disposeAnimation() {
    _controller.dispose();
  }
}
