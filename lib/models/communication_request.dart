class CommunicationRequest {
  Communication? communication;

  CommunicationRequest({this.communication});

  CommunicationRequest.fromJson(Map<String, dynamic> json) {
    communication = json['communication'] != null
        ? new Communication.fromJson(json['communication'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.communication != null) {
      data['communication'] = this.communication!.toJson();
    }
    return data;
  }
}

class Communication {
  int? id;
  int? projectId;
  int? investorId;
  int? status;
  String? createdAt;
  String? updatedAt;
  Project? project;
  Investor? investor;

  Communication(
      {this.id,
        this.projectId,
        this.investorId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.project,
        this.investor});

  Communication.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
    investorId = json['investor_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    project =
    json['project'] != null ? new Project.fromJson(json['project']) : null;
    investor = json['investor'] != null
        ? new Investor.fromJson(json['investor'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_id'] = this.projectId;
    data['investor_id'] = this.investorId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.project != null) {
      data['project'] = this.project!.toJson();
    }
    if (this.investor != null) {
      data['investor'] = this.investor!.toJson();
    }
    return data;
  }
}

class Project {
  int? id;
  String? name;
  String? description;
  int? amount;
  String? location;
  int? investmentStatus;
  int? acceptStatus;
  int? investorId;
  int? userId;
  int? typeId;
  String? createdAt;
  String? updatedAt;
  User? user;

  Project(
      {this.id,
        this.name,
        this.description,
        this.amount,
        this.location,
        this.investmentStatus,
        this.acceptStatus,
        this.investorId,
        this.userId,
        this.typeId,
        this.createdAt,
        this.updatedAt,
        this.user});

  Project.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    amount = json['amount'];
    location = json['location'];
    investmentStatus = json['investment_status'];
    acceptStatus = json['accept_status'];
    investorId = json['investor_id'];
    userId = json['user_id'];
    typeId = json['type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['amount'] = this.amount;
    data['location'] = this.location;
    data['investment_status'] = this.investmentStatus;
    data['accept_status'] = this.acceptStatus;
    data['investor_id'] = this.investorId;
    data['user_id'] = this.userId;
    data['type_id'] = this.typeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
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

  User(
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
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class Investor {
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

  Investor(
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
        this.updatedAt});

  Investor.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}