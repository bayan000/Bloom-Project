/*
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:admin/Config/server_config.dart';
import 'package:admin/Services/OneProjectServices.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../controllers/CommunicationRequestsController.dart';
import '../models/report.dart';


class ReportsService{
  //********************* Fetching Reports *********************************//
    static Future<List<Report>> getReports(String url) async {
      print(GetStorage().read('token'));
      final response = await http.get(Uri.parse("https://noor-demo-store.webmyidea.com/api/admin/reports"
      ),headers: {
        'Authorization':'Bearer  ${GetStorage().read('token')}',
        'Accept':'application/json',
      });
      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body) as Map<String, dynamic>;
        final ReortsData = jsonBody['data'] as List<dynamic>;
        final reports = ReortsData.map((projectData) => Report.fromJson(projectData)).toList();
        CommunicationRequestsController communicationRequestsController=CommunicationRequestsController();
        for(int i=0; i<reports.length; i++){
          final name=await communicationRequestsController.getProjectName(reports[i].projectId);
          reports[i].projectName=name;
        }
        print("reports are here");
        return reports;
      } else {
        print(response.reasonPhrase.toString()+"whyyyyyyyyyy");
        throw Exception('Failed to fetch reports: ${response.statusCode}');
      }
    }

    //********************* Fetching Project Reports *********************************//
    static Future<List<Report>> fetchProjectReports(String url) async {
      final response = await http.get(Uri.parse(url),headers: {
        'Authorization':'Bearer  ${GetStorage().read('token')}',
        'content-Type':'application/json',
      });

      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body) as Map<String, dynamic>;
        if (decodedData['status'] == 200) {
          final dataList = decodedData['data'] as List<dynamic>;
          final reports = dataList.map((data) => Report.fromJson(data)).toList();
          CommunicationRequestsController communicationRequestsController=CommunicationRequestsController();
          for(int i=0; i<reports.length; i++){
            final name=await communicationRequestsController.getProjectName(reports[i].projectId);
            reports[i].projectName=name;
          }
          return reports;
        } else {
          throw Exception('Failed to fetch reports: ${response.statusCode}');
        }
      } else {
        throw Exception('Failed to fetch reports: ${response.statusCode}');
      }
    }

    //********************* Fetching A Report *********************************//

    static Future<Report> getReportInformation(String url) async {

      print("fetching");
      final response = await http.get(Uri.parse(url),headers: {
        'Authorization':'Bearer  ${GetStorage().read('token')}',
        'content-Type':'application/json',
      });
      final statusCode = response.statusCode;

      if (statusCode == 200) {
        print("done fetching");

        final data = json.decode(response.body) as Map<String, dynamic>;
        final reportData = data['data'] as Map<String, dynamic>;
        final report= Report.fromJson(reportData);
        CommunicationRequestsController communicationRequestsController=CommunicationRequestsController();
        report.projectName=await communicationRequestsController.getProjectName(report.projectId);

        return report;
      } else {
        throw Exception('Failed to fetch reports: ${response.statusCode}');
      }
    }


}
*/
import 'dart:convert' as convert;
import 'dart:convert';
import 'package:admin/Config/server_config.dart';
import 'package:admin/Services/OneProjectServices.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../controllers/CommunicationRequestsController.dart';
import '../models/report.dart';


class ReportsService{
  //********************* Fetching Reports *********************************//
  static Future<List<Report>> getReports(String url) async {
    final response = await http.get(Uri.parse('https://noor-demo-store.webmyidea.com/api/admin/reports'),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'Content-Type':'application/json',
      'Accept':'application/json',
    });
    if (response.statusCode == 200) {
      print("reports 200");
      final jsonBody = json.decode(response.body) as Map<String, dynamic>;
      final ReortsData = jsonBody['data'] as List<dynamic>;
      final reports = ReortsData.map((projectData) => Report.fromJson(projectData)).toList();
      CommunicationRequestsController communicationRequestsController=CommunicationRequestsController();
      for(int i=0; i<reports.length; i++){
        final name=await communicationRequestsController.getProjectName(reports[i].projectId);
        reports[i].projectName=name;
      }
      return reports;
    } else {
      print("The reason: "+ response.reasonPhrase.toString());
      throw Exception('Failed to fetch reports: ${response.statusCode}');
    }
  }

  //********************* Fetching Project Reports *********************************//
  static Future<List<Report>> fetchProjectReports(String url) async {
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body) as Map<String, dynamic>;
      if (decodedData['status'] == 200) {
        final dataList = decodedData['data'] as List<dynamic>;
        final reports = dataList.map((data) => Report.fromJson(data)).toList();
        CommunicationRequestsController communicationRequestsController=CommunicationRequestsController();
        for(int i=0; i<reports.length; i++){
          final name=await communicationRequestsController.getProjectName(reports[i].projectId);
          reports[i].projectName=name;
        }
        return reports;
      } else {
        throw Exception('Failed to fetch reports: ${response.statusCode}');
      }
    } else {
      throw Exception('Failed to fetch reports: ${response.statusCode}');
    }
  }

  //********************* Fetching A Report *********************************//

  static Future<Report> getReportInformation(String url) async {

    print("fetching");
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });
    final statusCode = response.statusCode;

    if (statusCode == 200) {
      print("done fetching");

      final data = json.decode(response.body) as Map<String, dynamic>;
      final reportData = data['data'] as Map<String, dynamic>;
      final report= Report.fromJson(reportData);
      CommunicationRequestsController communicationRequestsController=CommunicationRequestsController();
      report.projectName=await communicationRequestsController.getProjectName(report.projectId);

      return report;
    } else {
      throw Exception('Failed to fetch reports: ${response.statusCode}');
    }
  }


}







