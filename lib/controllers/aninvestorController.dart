import 'package:admin/Config/server_config.dart';
import 'package:admin/Services/InvestorService.dart';
import 'package:admin/Services/InvestorsService.dart';
import 'package:flutter/cupertino.dart';

import '../screens/dashboard/components/Investors/one_investor.dart';


class InvestorController extends ChangeNotifier {
  AnInvestor? selectedInvestor;// To store the fetched investor
  AnInvestor currInvestor=AnInvestor();

//fetchAnInvestor--------------------------------

  Future<AnInvestor> fetchInvestorById(var investorId) async {
    print(investorId.toString()+"ididididiidididiididiid");
    if (investorId==null)investorId=1;
    print(investorId.toString()+"ididididiidididiididiid222222222");

    final response = await InvestorService.fetchInvestor(ServerConfig.url + ServerConfig.getAnInvestor+ investorId.toString());
    notifyListeners(); // Notify UI about the change
    return response;

  }

//fetchInvestorName--------------------------------
  Future<String> fetchInvestorName(var id) async{
    final name=await InvestorService.fetchInvestorName(ServerConfig.url+ServerConfig.getAnInvestor+id.toString());

    return name;
  }
//currInvestor----------------------------------
  curr_Investor(AnInvestor investor){
    this.currInvestor=investor;
    notifyListeners();
    return investor;
  }
}
