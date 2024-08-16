import 'dart:convert';
import 'package:admin/models/messagesIndex.dart';
import 'package:admin/models/usersWithUnseenMessages.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../Config/server_config.dart';

class MessagesService {
  MessagesService();
  List<Message> model = <Message>[];

  Future<List<Message>> getMessages() async {
    var response = await http.post(
      Uri.parse(ServerConfig.url + ServerConfig.getIndex),
      headers: {
        'Authorization': 'Bearer ${GetStorage().read('token')}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<dynamic> messages = data['messages'];

      return messages.map((messageData) => Message.fromJson(messageData)).toList();
    } else {
      return [];
    }
  }
  // Add the following method to fetch older messages
  Future<List<Message>> getOlderMessages(String token, DateTime lastMessageDate, int receiver_id,String receiver_type) async {
    var response = await http.post(
      Uri.parse(ServerConfig.url + ServerConfig.getIndex),
      headers: {
        'Authorization': 'Bearer ${GetStorage().read('token')}',
        'Accept': 'application/json',
      },
      body: {
        'last_message_date': lastMessageDate.toIso8601String(),  // Pass the date of the last message
        'receiver_id':2,
        'receiver_type':"user",

      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var r = await json.decode((response.body));
      Map<String, dynamic> s = r;
      List<dynamic> messages = s['messages'];
      for (var i in messages) {
        model.insert(0, Message.fromJson(i));  // Insert older messages at the beginning
      }
      return model;
    } else {
      return [];
    }
  }
  var message;
  Future<bool> sendMessage(ChatModel model) async {
    var response = await http.post(
      Uri.parse(ServerConfig.url + ServerConfig.sendMessage),
      body: {
        "receiver_id":model.receiver_id,
        "receiver_type":model.receiver_type,
        "content": model.content,
      },
      headers: {
        'Authorization': 'Bearer ${GetStorage().read('token')}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 404) {
      message = "Something wrong!";
      return false;
    } else {
      return false;
    }
  }

  static Future<InvestorsWithUnseenMessages?> getInvestorsMessages() async {
    final url = Uri.parse(ServerConfig.url + ServerConfig.getInvestorsWithUnseenMessages); // Replace with your actual API URL
    final response = await http.get(url,headers: {
      'Authorization': 'Bearer ${GetStorage().read('token')}',
      'Accept': 'application/json',
    },);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return InvestorsWithUnseenMessages.fromJson(data);
    } else {
      // Handle API errors
      print('Error getting investors Messages: ${response.statusCode}');
      return null;
    }
  }
  static Future<UsersWithUnseenMessages?> getUsersMessages() async {
    final url = Uri.parse(ServerConfig.url + ServerConfig.getUsersWithUnseenMessages); // Replace with your actual API URL
    final response = await http.get(url,headers: {
      'Authorization': 'Bearer ${GetStorage().read('token')}',
      'Accept': 'application/json',
    },);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return UsersWithUnseenMessages.fromJson(data);
    } else {
      // Handle API errors
      print('Error getting investors Messages: ${response.statusCode}');
      return null;
    }
  }
}



