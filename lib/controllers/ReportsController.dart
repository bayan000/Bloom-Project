import 'package:admin/Config/server_config.dart';
import 'package:admin/Services/ArticlesService.dart';
import 'package:admin/Services/ReportsService.dart';
import 'package:flutter/cupertino.dart';
import '../models/report.dart';

class ReportsController extends ChangeNotifier{
  List<Report> reports=[];
  Report report=Report();
  Report report0=Report();
 // int status=0;

  //fetchArticles------------------------------------------
  Future<List<Report>> fetchReports() async{
    reports=(await ReportsService.getReports(ServerConfig.url+ServerConfig.getRreports))!;
    return reports;
  }
  //curr_report------------------------------------------
  curr_report(Report report){
    this.report0=report;
    notifyListeners();
    return report;
  }
  //fetchReport------------------------------------------
  Future<Report> fetchReport(var Pid,var Rid) async{
  //https://grad2222.000webhostapp.com/api/admin/reports/1/1
    print(Pid.toString());
    print(Rid.toString());
    //  static String getARreport="admin/reports/";
    report=(await ReportsService.getReportInformation(ServerConfig.url+ServerConfig.getARreport+Pid.toString()+"/"+Rid.toString()))!;
    return report;
  }
/*
  //AddArticle------------------------------------------
  Future<void> addArticle(name,description,image) async{
    await ArticlesService.AddArticle(ServerConfig.url+ServerConfig.AddAnArticle, name,description,image);
  }
  //DeleteArticle------------------------------------------
  Future<int> deleteArticle(var id) async{
    status= await ArticlesService.DeleteAnArticle(ServerConfig.url+ServerConfig.DeleteAnArticle+id.toString());
    return status;
  }*/
}