import 'package:flutter/material.dart';

class OnboardingViewModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void goToNextScreen(BuildContext context) {
    setLoading(true);
    Future.delayed(const Duration(seconds: 1), () {
      setLoading(false);
      // Example navigation (you can replace it)
      Navigator.pushReplacementNamed(context, '/home');
    });
  }
}
