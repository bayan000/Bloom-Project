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

  //fetchReports------------------------------------------
  Future<List<Report>> fetchReports() async{
    reports=(await ReportsService.getReports(ServerConfig.url+ServerConfig.getRreports))!;
    return reports;
  }
  //fetchReports------------------------------------------
  Future<List<Report>> fetchProjectReports(id) async{
    reports=(await ReportsService.fetchProjectReports(ServerConfig.url+ServerConfig.getAProjectRreports+id.toString()))!;
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
    print(Pid.toString());
    print(Rid.toString());
    report=(await ReportsService.getReportInformation(ServerConfig.url+ServerConfig.getARreport+Pid.toString()+"/"+Rid.toString()))!;
    return report;
  }

}