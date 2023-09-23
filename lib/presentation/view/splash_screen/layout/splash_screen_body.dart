import 'dart:async';
import 'package:covidapp/presentation/elements/custom_text.dart';
import 'package:covidapp/presentation/view/world_screen/world_screen_view.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;


class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> with TickerProviderStateMixin{

  late final AnimationController _animationController = AnimationController(
    duration: const Duration(seconds: 3),
      vsync: this)..repeat();


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5), () => Navigator.push(context, MaterialPageRoute(builder: (context) => const WorldScreenView(),)));

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _animationController,
          child: Center(
            child: SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.2,
                width: MediaQuery.sizeOf(context).width * 0.7,
                child: const Image(image: AssetImage('assets/images/virus.png'),)),
          ),
          builder: (context, child) {
            return Transform.rotate(
              angle: _animationController.value * 2.0 * math.pi , child: child,
          );
        },),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.08,),
        CustomText(textTitle: 'Covid 19\nTracker App', fontSize: 25.0,)
      ],
    );
  }
}
