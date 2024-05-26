class Workers {
  List<Worker>? worker;
  String? message;
  int? status;

  Workers({this.worker, this.message, this.status});

  Workers.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      worker = <Worker>[];
      json['data'].forEach((v) {
        worker!.add(new Worker.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.worker != null) {
      data['data'] = this.worker!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Worker {
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

  Worker(
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
        this.updatedAt});

  Worker.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
class user2{
  final String? first_name,otp,last_name,user_type,email,property_deed,clean_record,location,iD_card,personal_photo,created_at,updated_at,phone;
  int verified;
  user2({this.property_deed, this.clean_record,
    this.created_at,this.updated_at,
    this.location,this.phone,this.first_name,this.email,this.last_name,
    this.iD_card,required this.otp,this.personal_photo,this.user_type,required this.verified
  });
}
List user2_list_item = [
  user2(
    verified: 1,
    otp: "0000",
    location: "دمشق",
    phone: "0987654321",
    first_name: "فلان",
    last_name: "الفلاني",
    email: "user@gmail.com",
    personal_photo: "photo",
    user_type: "investor",

  ),
];
