import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  String? textTitle;
  double fontSize;
  TextAlign textAlign;
  FontWeight fontWeight;
  CustomText({super.key, this.textTitle , this.fontSize = 10, this.fontWeight = FontWeight.w500, this.textAlign = TextAlign.center});

  @override
  Widget build(BuildContext context) {
    return Text(
      textTitle.toString(),
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign ,
    );
  }
}
