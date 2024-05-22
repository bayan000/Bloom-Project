
import 'package:admin/Config/server_config.dart';
import 'package:admin/Services/LoginService.dart';
import 'package:admin/models/loginModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class LoginController extends ChangeNotifier{
  late GlobalKey<FormState> formstate=GlobalKey<FormState>();
  late String emailController;
  late String passwordController;
  late int loginState;
  var message ;
  Admin? adminUser=Admin();


//login-------------------------------------
  Future<Admin?> login() async {
    loginState=1;
  var formdata = formstate.currentState;
  if (formdata!.validate()) {
      formdata.save();
       adminUser = await LoginService.postLogin(ServerConfig.url+ServerConfig.logIn, emailController, passwordController);
      if (adminUser != null) {

        print('Login successful! Welcome, ${adminUser!.firstName} ${adminUser!.lastName}');
        EasyLoading.showSuccess('Login successful! Welcome, ${adminUser!.firstName} ${adminUser!.lastName}');
        //loginState=1;



      } else {
        print('Login failed.');
        EasyLoading.showError('Login failed');
       // loginState=0;

      }
  }


}
//logout-------------------------------------
  Future onClickLogout()async{
    message=await LoginService.logoutfun(ServerConfig.url+ServerConfig.logOut);
  }

}