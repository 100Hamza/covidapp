import 'package:flutter/material.dart';

class CustomEditTextField extends StatefulWidget {
  TextEditingController controller;
  Function(String?) onChanged;
  CustomEditTextField({super.key , required this.controller , required this.onChanged});

  @override
  State<CustomEditTextField> createState() => _CustomEditTextFieldState();
}

class _CustomEditTextFieldState extends State<CustomEditTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller ,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        hintText: 'Search with Country name',
        border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(50.0)
        )
      ),
    );
  }
}
