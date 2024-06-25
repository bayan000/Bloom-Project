/*import 'dart:convert';
import 'package:http/http.dart' as http;




String url = 'https://your-api-endpoint.com/login'; // Replace with your actual URL
String email = 'user@example.com';
String password = 'your_password';


*/
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import '../models/loginModel.dart';


class LoginService {
  static var message ;
  static var token;

//-----------------------------LOGIN-----------------------------------------
  static Future<Admin?> postLogin(String url, String email, String password) async {
    final Map<String, dynamic> body = {'email': email, 'password':password};

      final response = await http.post(Uri.parse(url), body: jsonEncode(body),headers: {
        "Access-Control-Allow-Origin": "*",

        'content-Type':'application/json',
      });
      if (response.statusCode == 200) {

        final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        message=jsonResponse['message'];
        print(message);

        if (jsonResponse['status'] == 200 && jsonResponse['data'] != null) {
          final admin = Admin.fromJson(jsonResponse['data']);
          final status = jsonResponse['status'];
          token=admin.token;
          await GetStorage().write('token', admin.token);
          print(await GetStorage().read('token'));

          return admin;

        } else {
          print('Error: Login failed. Message: ${jsonResponse['message'] ?? 'Unknown error'}');
          return null;
        }



      }


}
//-------------------------LOGOUT----------------------------------------
  static Future<String> logoutfun(url)async{
    var response = await http.get(
      Uri.parse(url),
      headers: {
        'auth': 'Bearer  ${GetStorage().read('token')}',
        'Accept': 'application/json',

      },);
    Map<String,dynamic> json=jsonDecode(response.body);
    print(await GetStorage().read('token'));
   await GetStorage().remove('token');
    return json['message'];

  }

}