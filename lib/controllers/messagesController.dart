import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

import '../Services/messages_service.dart';
import '../models/messagesIndex.dart';
import '../models/usersWithUnseenMessages.dart';

class MessagesController extends ChangeNotifier {
  late MessagesService _messagesService;
  bool _isLoading = true;
  List<Message> _messages = [];
  bool get isLoading => _isLoading;
  List<Message> get messages => _messages;
  InvestorsWithUnseenMessages? _investorsWithUnseenMessages;
  UsersWithUnseenMessages? _usersWithUnseenMessages;

  Future<void> getMessages() async {
    _isLoading = true;
    notifyListeners();
    try {
      final messages = await _messagesService.getMessages();
      _messages = messages;
    } catch (error) {
      // Handle error
      print('Error fetching messages: $error');
    }
    _isLoading = false;
    notifyListeners();
  }
  Future<void> getOlderMessages(DateTime lastMessageDate) async {
    _isLoading = true;
    notifyListeners();
    try {
      final messages = await _messagesService.getOlderMessages(
          GetStorage().read('token'), lastMessageDate, 2, "user"); // Replace 2 and "user" with actual values
      _messages.addAll(messages); // Add older messages to existing list
    } catch (error) {
      // Handle error
      print('Error fetching older messages: $error');
    }
    _isLoading = false;
    notifyListeners();
  }
  Future<bool> sendMessage(ChatModel model) async {
    final success = await _messagesService.sendMessage(model);
    if (success) {
      print("sent");
    } else {
      print("oh, no");
    }
    return success;
  }
  Future<void> getInvestorsMessages() async {
    try {
      final investorsData = await MessagesService.getInvestorsMessages();
      _investorsWithUnseenMessages = investorsData;
      notifyListeners();
    } catch (error) {
      // Handle error
      print('Error fetching investors with unseen messages: $error');
    }
  }
  Future<void> getUsersMessages() async {
    try {
      final usersData = await MessagesService.getUsersMessages();
      _usersWithUnseenMessages = usersData;
      notifyListeners();
    } catch (error) {
      // Handle error
      print('Error fetching users with unseen messages: $error');
    }
  }
}
