
import 'package:admin/Services/WorkersService.dart';
import 'package:admin/models/workers.dart';
import 'package:flutter/material.dart';

import '../Config/server_config.dart';

class WorkersController extends ChangeNotifier {
  List<Worker> investors=[];
  Worker? selectedWorker;// To store the fetched investor
  Worker currWorker=Worker();
//fetchInvestors--------------------------------
  Future<List<Worker>> fetchWorkers() async{
    investors=await WorkersService.fetchWorkers(ServerConfig.url+ServerConfig.getAllWorkers);//fetchInvestors(ServerConfig.url+ServerConfig.getAllInvestors);

    return investors;
  }

  curr_Worker(Worker worker){
    this.currWorker=worker;
    notifyListeners();
    return worker;
  }

}