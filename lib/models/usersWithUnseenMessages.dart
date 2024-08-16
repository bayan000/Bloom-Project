class UsersWithUnseenMessages {
  bool? status;
  List<Users>? users;

  UsersWithUnseenMessages({this.status, this.users});

  UsersWithUnseenMessages.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  int? id;
  String? firstName;
  String? lastName;
  String? userType;
  String? email;
  int? verified;
  String? otp;
  String? deviceToken;
  String? phone;
  String? location;
  String? iDCard;
  String? personalPhoto;
  String? propertyDeed;
  String? cleanRecord;
  String? createdAt;
  String? updatedAt;
  int? unseenMessagesCount;

  Users(
      {this.id,
        this.firstName,
        this.lastName,
        this.userType,
        this.email,
        this.verified,
        this.otp,
        this.deviceToken,
        this.phone,
        this.location,
        this.iDCard,
        this.personalPhoto,
        this.propertyDeed,
        this.cleanRecord,
        this.createdAt,
        this.updatedAt,
        this.unseenMessagesCount});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userType = json['user_type'];
    email = json['email'];
    verified = json['verified'];
    otp = json['otp'];
    deviceToken = json['device_token'];
    phone = json['phone'];
    location = json['location'];
    iDCard = json['iD_card'];
    personalPhoto = json['personal_photo'];
    propertyDeed = json['property_deed'];
    cleanRecord = json['clean_record'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    unseenMessagesCount = json['unseen_messages_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_type'] = this.userType;
    data['email'] = this.email;
    data['verified'] = this.verified;
    data['otp'] = this.otp;
    data['device_token'] = this.deviceToken;
    data['phone'] = this.phone;
    data['location'] = this.location;
    data['iD_card'] = this.iDCard;
    data['personal_photo'] = this.personalPhoto;
    data['property_deed'] = this.propertyDeed;
    data['clean_record'] = this.cleanRecord;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['unseen_messages_count'] = this.unseenMessagesCount;
    return data;
  }
}


//send message
class SendMessage {
  String? status;

  SendMessage({this.status});

  SendMessage.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}


class InvestorsWithUnseenMessages {
  bool? status;
  List<Investors>? investors;

  InvestorsWithUnseenMessages({this.status, this.investors});

  InvestorsWithUnseenMessages.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['investors'] != null) {
      investors = <Investors>[];
      json['investors'].forEach((v) {
        investors!.add(new Investors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.investors != null) {
      data['investors'] = this.investors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Investors {
  int? id;
  String? firstName;
  String? lastName;
  String? userType;
  String? email;
  int? verified;
  String? password;
  String? otp;
  String? deviceToken;
  String? phone;
  String? location;
  String? iDCard;
  String? personalPhoto;
  String? createdAt;
  String? updatedAt;
  int? unseenMessagesCount;

  Investors(
      {this.id,
        this.firstName,
        this.lastName,
        this.userType,
        this.email,
        this.verified,
        this.password,
        this.otp,
        this.deviceToken,
        this.phone,
        this.location,
        this.iDCard,
        this.personalPhoto,
        this.createdAt,
        this.updatedAt,
        this.unseenMessagesCount});

  Investors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userType = json['user_type'];
    email = json['email'];
    verified = json['verified'];
    password = json['password'];
    otp = json['otp'];
    deviceToken = json['device_token'];
    phone = json['phone'];
    location = json['location'];
    iDCard = json['iD_card'];
    personalPhoto = json['personal_photo'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    unseenMessagesCount = json['unseen_messages_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_type'] = this.userType;
    data['email'] = this.email;
    data['verified'] = this.verified;
    data['password'] = this.password;
    data['otp'] = this.otp;
    data['device_token'] = this.deviceToken;
    data['phone'] = this.phone;
    data['location'] = this.location;
    data['iD_card'] = this.iDCard;
    data['personal_photo'] = this.personalPhoto;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['unseen_messages_count'] = this.unseenMessagesCount;
    return data;
  }
}