import 'package:covidapp/presentation/elements/custom_text.dart';
import 'package:flutter/material.dart';

class CustomDataWidget extends StatelessWidget {
  String title, value;


  CustomDataWidget({super.key , required this.value , required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(textTitle: title, fontSize: 14),
              CustomText(textTitle: value, fontSize: 14,),
            ],
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.007,),
          Divider(),
        ],
      ),
    );
  }
}
