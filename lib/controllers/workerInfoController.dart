
import 'package:flutter/material.dart';

import '../Config/server_config.dart';
import '../Services/WorkerDetailsService.dart';
import '../screens/dashboard/components/Workers/workerModel.dart';

class WorkerInfoController extends ChangeNotifier {
  WorkerDetails? selectedWorker;// To store the fetched investor
  WorkerDetails currWorker=WorkerDetails();
  Future<WorkerDetails> fetchWorkerById(var WorkerId) async {
    print(WorkerId.toString()+"ididididiidididiididiid");
    if (WorkerId==null) WorkerId=5;
    print(WorkerId.toString()+"ididididiidididiididiid222222222");

    final response = await WorkerDetailsService.fetchWorkerDetails(ServerConfig.url + ServerConfig.getAWorker+ WorkerId.toString());
    notifyListeners(); // Notify UI about the change
    return response;

  }
//currWorker----------------------------------
  curr_Worker(WorkerDetails worker){
    this.currWorker=worker;
    notifyListeners();
    return worker;
  }
}
