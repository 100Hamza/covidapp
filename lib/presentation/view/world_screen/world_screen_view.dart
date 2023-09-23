import 'package:covidapp/presentation/view/world_screen/layout/world_screen_body.dart';
import 'package:flutter/material.dart';

class WorldScreenView extends StatelessWidget {
  const WorldScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: WorldScreenBody()),
    );
  }
}
