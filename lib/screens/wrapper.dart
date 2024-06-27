import 'package:flutter/material.dart';
import 'package:money_app/screens/onboarding_screen.dart';

import 'main_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key, required this.isLogin});

  final bool isLogin;

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.isLogin
        ? const MainScreen()
        : const OnboardingScreen();
  }
}
