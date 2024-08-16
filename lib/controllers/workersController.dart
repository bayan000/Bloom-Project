
import 'package:admin/Services/WorkersService.dart';
import 'package:admin/models/workers.dart';
import 'package:flutter/material.dart';

import '../Config/server_config.dart';

class WorkersController extends ChangeNotifier {
  List<Worker> workers=[];
  Worker? selectedWorker;// To store the fetched investor
  Worker currWorker=Worker();
//fetchInvestors--------------------------------
  Future<List<Worker>> fetchWorkers() async{
    workers=await WorkersService.fetchWorkers(ServerConfig.url+ServerConfig.getAllWorkers);

    return workers;
  }

  curr_Worker(Worker worker){
    this.currWorker=worker;
    notifyListeners();
    return worker;
  }

}