import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scanner/routes/routename.dart';
import 'package:scanner/screens/loginPage.dart';
import 'package:scanner/screens/qrpage.dart';
import 'package:scanner/screens/registration.dart';
import 'package:scanner/screens/scannerPage.dart';
import 'package:scanner/screens/welcome.dart';

class Approot {
  static Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case Routename.loginpage:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
      case Routename.registrationpage:
        return MaterialPageRoute(
          builder: (context) => Register(),
        );
      case Routename.scannerpage:
        return MaterialPageRoute(
          builder: (context) => Qrscanner(),
        );
      case Routename.qrpage:

        return MaterialPageRoute(builder: (context) => QrPage(rollno:settings.arguments as String ),);
      case Routename.welcomepage:
        return MaterialPageRoute(builder: (context) => Welcome(
          profile: settings.arguments as Map<String,dynamic>,
        ),);
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(),
        );
    }
  }
}
