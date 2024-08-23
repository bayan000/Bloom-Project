
import 'dart:convert';

import 'package:admin/Services/appointments_service.dart';
import 'package:admin/models/appointments.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;


class AppointmentsController extends ChangeNotifier{
  Appointments appointments=Appointments();
  String time_period='';
  int status=0;
  String meetingLink="l";
  //fetchAppointmentss------------------------------------------
  Future<Appointments> fetchAppointments() async{
    appointments=(await AppointmentsService.fetchAppointments())!;
    return appointments;
  }

  Future<int> addAppointment(String hour,String time_period) async{
    status= await AppointmentsService.AddAppointment(hour,time_period);
    return status;
  }
  Future<int> UpdateAppointment(int id,String hour) async{
    status= await AppointmentsService.UpdateAppointment(id,hour);
    notifyListeners();
    return status;
  }


  Future<Meetings> fetchMeetings() async {
    final response = await http.get(Uri.parse("https://noor-demo-store.webmyidea.com/api/admin/Meeting"),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });

    if (response.statusCode == 200) {
      print("meeting are here");
      final jsonResponse = jsonDecode(response.body);
      return Meetings.fromJson(jsonResponse);
    } else {
      print(response.reasonPhrase);
      throw Exception('Failed to fetch meetings: ${response.statusCode}');
    }
  }
  UpdateTimePeriod(var time_period){
    this.time_period=time_period;
    notifyListeners();
    return time_period;
  }
  Future<String> fetchZoomMeetingLink() async {
    final response = await http.post(
      Uri.parse("https://noor-demo-store.webmyidea.com/api/getLink"),
      headers: {
        'Authorization': 'Bearer ${GetStorage().read('token')}',
        'content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      print("u");
      final jsonResponse = jsonDecode(response.body);
      print(jsonResponse["link"]);
      print(meetingLink+ "     l");

      meetingLink=jsonResponse["link"];
      return jsonResponse["link"];

    } else {
    print(response.reasonPhrase);
    throw Exception('Failed to fetch Zoom meeting link: ${response.statusCode}');
    }
  }

  //https://noor-demo-store.webmyidea.com/api/admin/Meeting/

}
