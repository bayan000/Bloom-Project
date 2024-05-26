class WorkerDetails {
  Worker? worker;
  String? message;
  int? status;

  WorkerDetails({this.worker, this.message, this.status});

  WorkerDetails.fromJson(Map<String, dynamic> json) {
    worker = json['data'] != null ? new Worker.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.worker != null) {
      data['data'] = this.worker!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Worker {
  User? user;
  List<Projects>? projects;

  Worker({this.user, this.projects});

  Worker.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(new Projects.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
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
  String? phone;
  String? location;
  String? iDCard;
  String? personalPhoto;
  String? propertyDeed;
  String? cleanRecord;
  String? createdAt;
  String? updatedAt;
  List<Projects>? projects;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.userType,
        this.email,
        this.verified,
        this.otp,
        this.phone,
        this.location,
        this.iDCard,
        this.personalPhoto,
        this.propertyDeed,
        this.cleanRecord,
        this.createdAt,
        this.updatedAt,
        this.projects});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userType = json['user_type'];
    email = json['email'];
    verified = json['verified'];
    otp = json['otp'];
    phone = json['phone'];
    location = json['location'];
    iDCard = json['iD_card'];
    personalPhoto = json['personal_photo'];
    propertyDeed = json['property_deed'];
    cleanRecord = json['clean_record'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['projects'] != null) {
      projects = <Projects>[];
      json['projects'].forEach((v) {
        projects!.add(new Projects.fromJson(v));
      });
    }
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
    data['phone'] = this.phone;
    data['location'] = this.location;
    data['iD_card'] = this.iDCard;
    data['personal_photo'] = this.personalPhoto;
    data['property_deed'] = this.propertyDeed;
    data['clean_record'] = this.cleanRecord;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.projects != null) {
      data['projects'] = this.projects!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Projects {
  int? id;
  String? name;
  String? description;
  String? feasibilityStudy;
  int? amount;
  String? location;
  int? investmentStatus;
  int? acceptStatus;
  int? investorId;
  int? userId;
  int? typeId;
  String? createdAt;
  String? updatedAt;

  Projects(
      {this.id,
        this.name,
        this.description,
        this.feasibilityStudy,
        this.amount,
        this.location,
        this.investmentStatus,
        this.acceptStatus,
        this.investorId,
        this.userId,
        this.typeId,
        this.createdAt,
        this.updatedAt});

  Projects.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    feasibilityStudy = json['feasibility_study'];
    amount = json['amount'];
    location = json['location'];
    investmentStatus = json['investment_status'];
    acceptStatus = json['accept_status'];
    investorId = json['investor_id'];
    userId = json['user_id'];
    typeId = json['type_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['feasibility_study'] = this.feasibilityStudy;
    data['amount'] = this.amount;
    data['location'] = this.location;
    data['investment_status'] = this.investmentStatus;
    data['accept_status'] = this.acceptStatus;
    data['investor_id'] = this.investorId;
    data['user_id'] = this.userId;
    data['type_id'] = this.typeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}