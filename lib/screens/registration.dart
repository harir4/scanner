import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanner/provider/authprovider.dart';
import 'package:scanner/utils/constants/themeconstant.dart';
import 'package:scanner/widgets/button.dart';
import 'package:scanner/widgets/textField.dart';

import '../routes/routename.dart';

class Register extends StatelessWidget {
   Register({super.key});
  final name =TextEditingController();
  final rollno =TextEditingController();
  final email =TextEditingController();
  final password =TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: kgreen,
        body: Padding(
          padding: const EdgeInsets.only(top: 70, right: 20, left: 20),
          child: Column(
            children: [
              Text(
                'Registration',
                style: TextStyle(color: kwhite, fontSize: 30),
              ),
              SizedBox(
                height: 100,
              ),
              TextfieldCon(
                controller: name,
                  hinttext: 'Enter your name'),
              SizedBox(
                height: 30,
              ),
              TextfieldCon(
                controller: rollno,
                  hinttext: 'Enter your roll no'),
              SizedBox(
                height: 30,
              ),
              TextfieldCon(controller: email,
                  hinttext: 'Enter your Email',),
              SizedBox(
                height: 30,
              ),
              TextfieldCon(
                  controller:password,
                  hinttext: 'Enter your password'),
              SizedBox(
                height: 30,
              ),
              Consumer<AuthenticationProvider>(
                builder: (context,value,child) {
                  return value.loading ? Center(child: CircularProgressIndicator(color: Colors.white,),) :Buttonk(text: 'Register',onclick: (){

                    value.addRegister(context: context,name: name.text,rollno: rollno.text,email: email.text,password: password.text);
                  },);
                }
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have a account?',style:TextStyle(color:kwhite),),
                  TextButton(onPressed:(){
                    Navigator.pushNamed(context, Routename.loginpage);
                  },child: Text('Login',style:TextStyle(color:kwhite,fontWeight: FontWeight.bold)))
                ],
              )
            ],
          ),
        ));
  }
}
