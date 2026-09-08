import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  Future<dynamic> pushNamed(String screenName) {
    return Navigator.pushNamed(this, screenName);
  }

  void pop() {
    Navigator.pop(this);
  }

  Future<dynamic> pushReplacement(String screenName) {
    return Navigator.pushReplacementNamed(this, screenName);
  }

  Future<dynamic> pushAndRemoveUntil(String screenName) {
    return Navigator.pushNamedAndRemoveUntil(
      this,
      screenName,
      (route) => false,
    );
  }

  bool get canPop {
    return Navigator.canPop(this);
  }
}
