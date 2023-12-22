import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scanner/routes/routename.dart';
import 'package:scanner/utils/constants/themeconstant.dart';
import 'package:scanner/widgets/button.dart';

class QrPage extends StatelessWidget {
   QrPage({super.key, required this.rollno});
  final String rollno;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgreen,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_circle,size: 150,color: kwhite,),
          SizedBox(
            height: 50,
          ),
          Center(
            child: QrImageView(
              backgroundColor: kwhite,
              data:rollno,
              version: QrVersions.auto,
              size: 200.0,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Buttonk(text: 'Scan',onclick: (){
            Navigator.pushNamed(context,Routename.scannerpage);
          },),
        ],
      ),
    );
  }
}
