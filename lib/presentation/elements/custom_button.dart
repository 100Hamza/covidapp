import 'package:covidapp/presentation/elements/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  String buttonTitle;
  double fontSize;
  VoidCallback? onPress;
  CustomButton({super.key, required this.buttonTitle , this.fontSize = 16 , this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xff1aa260)
        ),
        child: Center(child: CustomText(textTitle: buttonTitle, fontSize: fontSize,)),
      ),
    );
  }
}
