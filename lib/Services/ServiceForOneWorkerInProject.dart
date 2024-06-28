/**/
import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/ShowAWorkerInAProject.dart';


class ServiceForOneWorkerInAProject{
  //fetchingAWorker'sName--------------------------------------------------
  static Future<String> fetchWorkerName(String url) async {
    print("try this id");
    print(url);
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'Accept':'application/json',
    });
    final statusCode = response.statusCode;
    final body = await response.body;
    if (statusCode == 200) {
      print("successful");
      final json = jsonDecode(body) as Map<String, dynamic>;
      ShowAWorkerInAProject worker =ShowAWorkerInAProject.fromJson(json);
      var fullName;
      //if(worker.user!.firstName!=null)
      if(worker.data!.user!.firstName!=null)
        print(worker.data!.user!.firstName);
      fullName=worker.data!.user!.firstName!+" "+worker.data!.user!.lastName!;
      //else
      if (fullName==null)
        fullName="No user";
      print(fullName);
      return fullName;
    } else {      print(response.body);

    throw Exception('Failed to fetch Worker: $statusCode');
    }
  }

}








