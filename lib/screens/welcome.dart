import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scanner/utils/constants/themeconstant.dart';

class Welcome extends StatelessWidget {
   Welcome({super.key,  this.profile,});
   Map<String,dynamic> ? profile;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgreen,
      body: Center(
        child: profile != null ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name:${profile!['name']}', style: kfontweightbold),
            Text('Rollno:${profile!['rollno']}', style: kfontweightbold),
            Text('Email:${profile!['email']}', style: kfontweightbold),

          ],
        ):Text('nodata'),
      ),
    );
  }
}
