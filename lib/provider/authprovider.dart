import 'package:flutter/material.dart';
import 'package:scanner/routes/routename.dart';
import 'package:scanner/services/apiservices.dart';

class AuthenticationProvider extends ChangeNotifier {
  final _apiService = ApiServices();

  bool loading = false;
  String? rollno;

  Map<String,dynamic>? profile;

  void addRegister({
    required BuildContext context,
    required String name,
    required String rollno,
    required String email,
    required String password,
  }) async {
    try {
      if (name.isNotEmpty &&
          rollno.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty) {
        loading = true;
        notifyListeners();
        await _apiService.register(
          name: name,
          password: password,
          rollno: rollno,
          email: email,
        );
        if (context.mounted) {
          Navigator.pushNamed(context, Routename.loginpage);
        }
        loading = false;
        notifyListeners();
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'field cannot be blank',
              ),
            ),
          );
        }
      }
    } catch (e) {
      loading = false;
      notifyListeners();
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.toString(),
            ),
          ),
        );
      }
    }
  }

  //login
  void login(
      {required String rollno,
      required String password,
      required BuildContext context}) async {
    try {
      if (rollno.isNotEmpty & password.isNotEmpty) {
        loading = true;
        notifyListeners();
        rollno = await _apiService.login(rollno: rollno, password: password);
        if(context.mounted){
          Navigator.pushNamed(context,Routename.qrpage,arguments: rollno);
        }
      }
    } catch (e) {
      loading=false;
      notifyListeners();
      if(context.mounted){

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()),));
      }
    }
  }
  void profilev({required String rollno,required BuildContext context})async{
    try {
      if (rollno.isNotEmpty ) {
        loading = true;
        notifyListeners();
        profile = await _apiService.profile(rollno:rollno);
        if(context.mounted){
          Navigator.pushNamed(context,Routename.welcomepage,arguments:profile);
        }
      }
    } catch (e) {
      loading=false;
      notifyListeners();
      if(context.mounted){

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()),));
      }
    }
  }

  }

