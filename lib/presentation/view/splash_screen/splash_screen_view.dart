import 'package:covidapp/presentation/view/splash_screen/layout/splash_screen_body.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashScreenBody(),);
  }
}
