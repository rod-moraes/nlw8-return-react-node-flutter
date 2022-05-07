import 'package:flutter/material.dart';

import '../../core/core.dart';

class SplashController {
  void redirectSplash(BuildContext context) async {
    try {
      await Future.delayed(Duration(seconds: 1), () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          RouterClass.home,
          (Route<dynamic> route) => false,
        );
      });
    } catch (e) {
      Navigator.pushNamedAndRemoveUntil(
          context, 'RouterClass.login', (Route<dynamic> route) => false);
    }
  }
}
