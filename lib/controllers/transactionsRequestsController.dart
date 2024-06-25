

import 'package:admin/Config/server_config.dart';
import 'package:admin/Services/TransactionsRequestsService.dart';
import 'package:admin/models/ApprovedTransactions.dart';
import 'package:admin/models/TransactionsRequests.dart';
import 'package:admin/models/viewTransactionsRequest.dart';
import 'package:flutter/cupertino.dart';

import '../models/transaction.dart';

class TransactionsRequestsController extends ChangeNotifier{
  TransactionsRequests transactionsRequests=TransactionsRequests();
  TransactionRequest transactionRequest=TransactionRequest();
  ApprovedTransactions approvedTransactions=ApprovedTransactions();
  int status=0;
  int pressed=0;

  
  //fetchTransactionsRequests------------------------------------------
  Future<TransactionsRequests> fetchTransactions() async{
    transactionsRequests=(await TransactionsRequestsService.fetchTransactionRequests(ServerConfig.url+ServerConfig.getTransactionsRequests))!;
    return transactionsRequests;
  }

  //fetchApprovedTransactions------------------------------------------
  Future<ApprovedTransactions> fetchApprovedTransactions() async{
    approvedTransactions=(await TransactionsRequestsService.fetchApprovedTransactions(ServerConfig.url+ServerConfig.getApprovedTransactions))!;
    return approvedTransactions;
  }

  //fetchTransaction------------------------------------------
  Future<ViewTranRequest> fetchTransaction(id) async{
    final transactionRequest0=(await TransactionsRequestsService.fetchATransactionsRequest(ServerConfig.url+ServerConfig.getATransactionsRequest+id.toString()))!;
    return transactionRequest0;
  }

  //approveTransaction----------------------------
  Future<int> approveTransaction(var id) async{
    status= await TransactionsRequestsService.ApproveTransaction(ServerConfig.url+ServerConfig.ApproveTransactionsRequests0+id.toString()+ServerConfig.ApproveTransactionsRequests1);
    return status;
  }

  //curr_transaction------------------------------------------
  curr_transactionRequest(TransactionRequest transactionsRequest){
    this.transactionRequest=transactionsRequest;
    notifyListeners();
    return transactionsRequest;
  }

  updatePressed(pressed){
    this.pressed=pressed;
    notifyListeners();
    return pressed;
  }

}