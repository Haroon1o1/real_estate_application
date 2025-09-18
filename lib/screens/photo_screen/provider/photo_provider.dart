import 'package:flutter/material.dart';

class PhotoProvider with ChangeNotifier {
  final PageController pageController = PageController(viewportFraction: 0.9);
  double _currentPage = 0.0;

  double get currentPage => _currentPage;

  PhotoProvider() {
    pageController.addListener(_listener);
  }

  void _listener() {
    _currentPage = pageController.page ?? 0.0;
    notifyListeners();
  }

  void jumpToPage(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    pageController.removeListener(_listener);
    pageController.dispose();
    super.dispose();
  }
}
