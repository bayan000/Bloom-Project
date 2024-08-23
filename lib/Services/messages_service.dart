import 'dart:convert';
import 'package:admin/models/messagesIndex.dart';
import 'package:admin/models/usersWithUnseenMessages.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../../Config/server_config.dart';

class MessagesService {
  MessagesService();
  List<Message> model = <Message>[];

  Future<List<Message>> getMessages(String receiver_id,String receiver_type,String last_message_time,String limit) async {
    print("getting messages..");
    var response = await http.post(
      Uri.parse(ServerConfig.url + ServerConfig.getIndex),
      body: {
        "receiver_id":receiver_id,
        "receiver_type":receiver_type,
        "last_message_time": last_message_time,
        "limit": limit,
      },
      headers: {
        'Authorization': 'Bearer ${GetStorage().read('token')}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      print("yes yes");
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<dynamic> messages = data['messages'];
      if (data['messages']!=null) {
        print("yes yes");

      }
      return messages.map((messageData) => Message.fromJson(messageData)).toList();
    } else {
      print("no");
      return [];
    }
  }
  var message;
  Future<bool> sendMessage(ChatModel model) async {
    print("sending to "+ model.receiver_id + " which is a " + model.receiver_type);

    var response = await http.post(
      Uri.parse(ServerConfig.url + ServerConfig.sendMessage),
      body: {
        "receiver_id":model.receiver_id.toString(),
        "receiver_type":model.receiver_type,
        "content": model.content,
      },
      headers: {
        'Authorization': 'Bearer ${GetStorage().read('token')}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("cool");
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
      print("all good");
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
      print("all good");
      final data = json.decode(response.body);
      return UsersWithUnseenMessages.fromJson(data);
    }
    else {
      print('Error getting investors Messages: ${response.statusCode}');
      return null;
    }
  }
}



