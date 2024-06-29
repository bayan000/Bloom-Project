
import 'package:admin/Config/server_config.dart';
import 'package:admin/Services/TransactionsService.dart';
import 'package:admin/controllers/MenuAppController.dart';
import 'package:flutter/cupertino.dart';

import '../models/transaction.dart';

class TransactionsController extends ChangeNotifier{
  Transactions transactions=Transactions();
  Transaction transaction=Transaction();
  int status=0;



  //fetchTransactions------------------------------------------

  Future<Transactions> fetchTransactions() async{
    transactions=(await TransactionsService.fetchTransactions(ServerConfig.url+ServerConfig.getTransactions))!;
    return transactions;
  }
  //fetchTransaction------------------------------------------

  Future<Transaction> fetchTransaction(id) async{
   final transaction0=(await TransactionsService.fetchTransaction(ServerConfig.url+ServerConfig.getTransactions,id))!;
    return transaction0;
  }
//AddTransaction------------------------------------------
  Future<int> addTransaction(name,id,price,discount,description) async{
    status= await TransactionsService.AddOrUpdateTransaction(ServerConfig.url+ServerConfig.AddATransaction, name, price, discount, id, description);
    return status;
  }
  //UpdateTransaction------------------------------------------
  Future<int> UpdateTransaction(name,id,price,discount,description,trId) async{
    status= await TransactionsService.AddOrUpdateTransaction(ServerConfig.url+ServerConfig.UpdateATransaction+trId.toString(), name, price, discount, id, description);
    notifyListeners();
    return status;

  }
  //DeleteTransaction------------------------------------------
  Future<int> deleteTransaction(var id) async{
    status= await TransactionsService.DeleteTransaction(ServerConfig.url+ServerConfig.DeleteATransaction+id.toString());
    return status;
  }

  //curr_transaction------------------------------------------
  curr_transaction(Transaction transaction){
    this.transaction=transaction;
    notifyListeners();
    return transaction;
  }

}