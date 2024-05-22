class loginModel {
  Admin? admin;
  String? message;
  int? status;

  loginModel({this.admin, this.message, this.status});

  loginModel.fromJson(Map<String, dynamic> json) {
    admin = json['data'] != null ? new Admin.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.admin != null) {
      data['data'] = this.admin!.toJson();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Admin {
  int? id;
  String? firstName;
  String? lastName;
  String? userType;
  String? email;
  String? createdAt;
  String? updatedAt;
  String? token;

  Admin(
      {this.id,
        this.firstName,
        this.lastName,
        this.userType,
        this.email,
        this.createdAt,
        this.updatedAt,
        this.token});

  Admin.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userType = json['user_type'];
    email = json['email'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_type'] = this.userType;
    data['email'] = this.email;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['token'] = this.token;
    return data;
  }
}