import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:provider/provider.dart';
import 'package:scanner/provider/authprovider.dart';
import 'package:scanner/routes/routename.dart';
import 'package:scanner/utils/constants/themeconstant.dart';

class Qrscanner extends StatelessWidget {
  Qrscanner({super.key});
  var rawValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgreen,
      body: Center(
        child: Container(
          width: 250,
          height: 250,
          child: MobileScanner(
            onDetect: (barcode, args) {
              print(barcode.rawValue);
              if(barcode.rawValue != null){
                context.read<AuthenticationProvider>().profilev(rollno: barcode.rawValue!, context: context);

              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No Qr data')));
              }
            },
            allowDuplicates: false,
          ),
        ),
      ),
    );
  }
}
