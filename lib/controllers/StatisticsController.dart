import 'package:admin/Config/server_config.dart';
import 'package:admin/Services/StatisticsService.dart';
import 'package:admin/models/Statistics.dart';
import 'package:flutter/cupertino.dart';

class StatisticsController extends ChangeNotifier{
  List<MonthlyStatistics> monthlyStatistics=[];
  List<ProjectStatistics> projectStatistics=[];
  List<ReportsStatistics> reportStatistics=[];


  //fetchMonthlyStatistics------------------------------------------
  Future<List<MonthlyStatistics>> fetchMonthlyStatistics() async{
    monthlyStatistics=(await StatisticsService.fetchMonthlyStatistics(ServerConfig.url+ServerConfig.monthly_statistics))!;
    return monthlyStatistics;
  }

  //fetchProjectStatistics------------------------------------------
  Future<List<ProjectStatistics>> fetchProjectStatistics() async{
    projectStatistics=(await StatisticsService.fetchProjectStatistics(ServerConfig.url+ServerConfig.project_statistics))!;
    return projectStatistics;
  }
  //fetchReportsStatistics------------------------------------------
  Future<List<ReportsStatistics>> fetchReportsStatistics() async{
    reportStatistics=(await StatisticsService.fetchReportStatistics(ServerConfig.url+ServerConfig.Report_statistics))!;
    return reportStatistics;
  }
  
}