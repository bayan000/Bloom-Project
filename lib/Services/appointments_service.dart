import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../Config/server_config.dart';
import '../models/appointments.dart';


class AppointmentsService {
  static Future<Appointments> fetchAppointments() async {
    final url = Uri.parse("https://noor-demo-store.webmyidea.com/api/admin/Appointment");
    final response = await http.get(url,headers: {
      'Authorization': 'Bearer ${GetStorage().read('token')}',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      print("cool");
      final jsonResponse = jsonDecode(response.body);

    return Appointments.fromJson(jsonResponse);
    } else {
      print(response.reasonPhrase);

      throw Exception('Failed to fetch appointments: ${response.statusCode}');
    }
  }

  static Future<int> AddAppointment(String hour, String time_period) async {
    final Map<String, dynamic> body = {'hour': hour,'time_period':time_period};

    final response = await http.post(Uri.parse("https://noor-demo-store.webmyidea.com/api/admin/Appointment/store"), body: jsonEncode(body),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });
    print(response.body);

    if (response.statusCode == 201) {

      return response.statusCode;

    } else {
      print(response.body);
      print("Unknown error");
      return 0;
    }

  }
  static Future<int> UpdateAppointment(int id, String hour) async {
    final Map<String, dynamic> body = {'hour': hour};

    final response = await http.post(Uri.parse("https://noor-demo-store.webmyidea.com/api/admin/Appointment/update/"+id.toString()),
        body: jsonEncode(body),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });
    print(response.body);

    if (response.statusCode == 201) {

      return response.statusCode;

    } else {
      print(response.body);
      print("Unknown error");
      return 0;
    }

  }

}