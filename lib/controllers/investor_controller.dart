import 'package:admin/Config/server_config.dart';
import 'package:admin/Services/InvestorService.dart';
import 'package:admin/Services/InvestorsService.dart';
import 'package:admin/models/project_list.dart';
import 'package:flutter/cupertino.dart';

import '../models/investor.dart';

class InvestorsController extends ChangeNotifier {
  List<Investor> investors=[];
  Investor? selectedInvestor;// To store the fetched investor
  List<Project>? projects=[];
  Investor currInvestor=Investor();
//fetchInvestors--------------------------------
  Future<List<Investor>> fetchInvestors() async{
    investors=await InvestorsService.fetchInvestors(ServerConfig.url+ServerConfig.getAllInvestors);

    return investors;
  }

  curr_Investor(Investor investor){
    this.currInvestor=investor;
    notifyListeners();
    return investor;
  }

}
