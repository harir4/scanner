import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scanner/utils/constants/themeconstant.dart';

class Buttonk extends StatelessWidget {
  Buttonk({super.key, required this.text, required this.onclick});

  final String text;
  final VoidCallback onclick;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed:onclick,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(BeveledRectangleBorder(borderRadius: BorderRadius.circular(5))),
            backgroundColor: MaterialStatePropertyAll(kgreen),
            side: MaterialStatePropertyAll(
                BorderSide(color: Colors.white, width: 1,))));
  }
}
