class MessagesIndex {
  bool? status;
  List<Message>? messages;

  MessagesIndex({this.status, this.messages});

  MessagesIndex.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['messages'] != null) {
      messages = <Message>[];
      json['messages'].forEach((v) {
        messages!.add(new Message.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.messages != null) {
      data['messages'] = this.messages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Message {
  int? id;
  int? senderId;
  String? senderType;
  int? receiverId;
  String? receiverType;
  String? content;
  int? seen;
  String? createdAt;
  String? updatedAt;
  String? timeAgo;

  Message(
      {this.id,
        this.senderId,
        this.senderType,
        this.receiverId,
        this.receiverType,
        this.content,
        this.seen,
        this.createdAt,
        this.updatedAt,
        this.timeAgo});

  Message.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderId = json['sender_id'];
    senderType = json['sender_type'];
    receiverId = json['receiver_id'];
    receiverType = json['receiver_type'];
    content = json['content'];
    seen = json['seen'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    timeAgo = json['time_ago'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sender_id'] = this.senderId;
    data['sender_type'] = this.senderType;
    data['receiver_id'] = this.receiverId;
    data['receiver_type'] = this.receiverType;
    data['content'] = this.content;
    data['seen'] = this.seen;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['time_ago'] = this.timeAgo;
    return data;
  }
}
class ChatModel {
  String content;
  String receiver_id;
  String receiver_type;

  ChatModel({
    required this.content,
    required this.receiver_id,
    required this.receiver_type,
  });
}