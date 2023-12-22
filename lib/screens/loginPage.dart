import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanner/provider/authprovider.dart';
import 'package:scanner/routes/routename.dart';
import 'package:scanner/utils/constants/themeconstant.dart';
import 'package:scanner/widgets/button.dart';
import 'package:scanner/widgets/textField.dart';
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
 final rollno =TextEditingController();
  final password =TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kgreen,


      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text('Login',style: TextStyle(color:kwhite,fontSize: 40),),
            SizedBox(height: 15,),
            TextfieldCon(
              controller:rollno,
              hinttext: 'Enter your roll no',
            ),
            SizedBox(height: 25,),
            TextfieldCon(
              controller:password ,
              hinttext: 'Enter your password',
            ),
            SizedBox(
              height: 30,
            ),
            Consumer<AuthenticationProvider>(
                builder: (context,value,child) {
                  return value.loading ? Center(child: CircularProgressIndicator(color: Colors.white,),) :Buttonk(text: 'Login',onclick: (){

                    value.login(context: context,rollno: rollno.text,password: password.text);
                  },);
                }
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Dont have a account?',style:TextStyle(color:kwhite),),
                TextButton(onPressed:(){
                  Navigator.pushNamed(context, Routename.registrationpage);
                },child: Text('Register',style:TextStyle(color:kwhite,fontWeight: FontWeight.bold)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
