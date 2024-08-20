import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

import '../Services/messages_service.dart';
import '../models/messagesIndex.dart';
import '../models/usersWithUnseenMessages.dart';

class MessagesController extends ChangeNotifier {
  bool _isLoading = true;
  static List<Message> _messages = [];
  bool get isLoading => _isLoading;
  List<Message> get messages => _messages;
  InvestorsWithUnseenMessages? _investorsWithUnseenMessages;
  UsersWithUnseenMessages? _usersWithUnseenMessages;

  Timer? _timer;
  var useRID,uesRtype,lastMessageTime,limit;

  Future<List<Message>?> getMessages(String receiverId, String receiverType, String lastMessageTime, String limit) async {
    _isLoading = true;
    notifyListeners();
    try {
      final messages = await MessagesService().getMessages(receiverId, receiverType, lastMessageTime, limit);
      notifyListeners();
      if (messages == null) {
        return [];
      }
      _messages = messages;
      notifyListeners();
      return _messages;
    } catch (error) {
      print('Error fetching messages: $error');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
    notifyListeners();

  }

  Future<bool>      sendMessage(ChatModel model) async {
    final success = await MessagesService().sendMessage(model);
    if (success) {
      print("sent");
    } else {
      print("oh, no");
    }
    return success;
  }

  Future<InvestorsWithUnseenMessages?> getInvestorsMessages() async {
    try {
      final investorsData = await MessagesService.getInvestorsMessages();
      _investorsWithUnseenMessages = investorsData;
      notifyListeners();
      return _investorsWithUnseenMessages;
    } catch (error) {
      // Handle error
      print('Error fetching investors with unseen messages: $error');
      return _investorsWithUnseenMessages;
    }
  }

  Future<UsersWithUnseenMessages?> getUsersMessages() async {
    try {
      final usersData = await MessagesService.getUsersMessages();
      _usersWithUnseenMessages = usersData;
      notifyListeners();
      return _usersWithUnseenMessages;
    } catch (error) {
      // Handle error
      print('Error fetching users with unseen messages: $error');
      return _usersWithUnseenMessages;
    }
  }

  void startPolling() {
   // _timer = Timer.periodic(Duration(seconds: 5), (_) => getMessages(2.toString(),"user",DateTime.now().toString(),"100"));
    notifyListeners();// Improved readability
  }

  void stopPolling() {
    _timer?.cancel();
    notifyListeners();
  }
  UpdateIndexOfUser(var useRID,var uesRtype,var lastMessageTime,var limit){
    this.useRID=useRID;
    this.uesRtype=uesRtype;
    this.lastMessageTime=lastMessageTime;
    this.limit=limit;
    notifyListeners();
  }

}
