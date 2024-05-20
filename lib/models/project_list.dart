class project_list {
  List<Project>? data;
  String? message;
  int? status;

  project_list({this.data, this.message, this.status});

  project_list.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Project>[];
      json['data'].forEach((v) {
        data!.add(new Project.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Project {
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

  Project(
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

  Project.fromJson(Map<String, dynamic> json) {
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
