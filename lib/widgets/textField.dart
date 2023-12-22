import 'package:flutter/material.dart';
import 'package:scanner/utils/constants/themeconstant.dart';

class TextfieldCon extends StatelessWidget {
  TextfieldCon({super.key, required this.hinttext, required this.controller});

  final String hinttext;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: TextStyle(color: kwhite),
            enabled: true,
            border: outlineInputBorder,
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder));
  }

  var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color:kwhite, width: 2),
      borderRadius: BorderRadius.circular(10));
}
