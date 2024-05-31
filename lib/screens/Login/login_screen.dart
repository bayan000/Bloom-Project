

import 'package:admin/controllers/login_controller.dart';
import 'package:admin/screens/main/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../Components/MyButton.dart';
import '../../Components/TextField.dart';
import '../../constants.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController = LoginController();

  @override
  void initState() {
    super.initState();
    loginController.formstate = GlobalKey<FormState>(); // Initialize here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding:
        const EdgeInsets.only(top: 70, bottom: 30, left: 30, right: 30),
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key: loginController.formstate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: DrawerHeader(
                      child: Image.asset("assets/images/Bloom Logoooooooooo.png"),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      'Invest Wisely, Invest with Bloom',
                      style: communTextStyle24textColor
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Center(
                    child: Text(
                        'البريد الإلكتروني',
                        style: communTextStyle20textColor
                    ),
                  ),
                  Center(
                    child: MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {
                        loginController.emailController = value! ;
                      },
                      keyboardType: TextInputType.emailAddress,
                      blurRadius: 8,
                      offset: 10,
                      width: 348,
                      hieght: 62,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        if (!value.contains('@') || !value.contains('.')) {
                          return 'Incorrect format';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Text(
                        'كلمة المرور',
                        style: communTextStyle20textColor
                    ),
                  ),
                  Center(
                    child: MyTextField(
                      label: '',
                      hint: "",
                      textInputAction: TextInputAction.next,
                      onsave: (value) {
                        loginController.passwordController = value!;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      blurRadius: 8,
                      offset: 10,
                      width: 348,
                      hieght: 62,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'This field is required';
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: MyButton(
                      fontSize: 34,
                      onsave: () async{
                        if (loginController.formstate.currentState!.validate()) {
                          EasyLoading.show(status: 'Loading....');
                          await loginController.login();
                          if(loginController.adminUser!=null)
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => MainScreen()),
                            );}
                        else{
                          EasyLoading.showError('Something must have gone wrong');
                        }
                      },
                      width: 348,
                      height: 62,
                      text: 'تسجيل الدخول',
                      color: buttonColor,
                      radius: 15,
                      textColor: Colors.white,
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
