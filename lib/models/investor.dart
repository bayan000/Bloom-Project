class investors {
  List<Investor>? investor;
  String? message;
  int? status;

  investors({this.investor, this.message, this.status});

  investors.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      investor = <Investor>[];
      json['data'].forEach((v) {
        investor!.add(new Investor.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.investor != null) {
      data['data'] = this.investor!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
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
    data['phone'] = this.phone;
    data['location'] = this.location;
    data['iD_card'] = this.iDCard;
    data['personal_photo'] = this.personalPhoto;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
