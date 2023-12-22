import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanner/provider/authprovider.dart';
import 'package:scanner/routes/routename.dart';
import 'package:scanner/routes/routes.dart';


void main() {
  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) =>AuthenticationProvider()),
      ],

  child:    MaterialApp(
    initialRoute: Routename.loginpage,
    onGenerateRoute: Approot.generate,
  )));
}
