import 'package:admin/Config/server_config.dart';
import 'package:admin/Services/InvestorService.dart';
import 'package:flutter/cupertino.dart';

import '../models/investor.dart';

class InvestorsController extends ChangeNotifier {
  List<Investor> investors=[];
  Future<List<Investor>> fetchInvestors() async{
    investors=await InvestorsService.fetchInvestors(ServerConfig.url+ServerConfig.getAllInvestors);
    return investors;
  }
}
