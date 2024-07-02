class Complaints {
  List<Complaint>? complaint;
  String? message;
  int? status;

  Complaints({this.complaint, this.message, this.status});

  Complaints.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      complaint = <Complaint>[];
      json['data'].forEach((v) {
        complaint!.add(new Complaint.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.complaint != null) {
      data['data'] = this.complaint!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Complaint {
  int? id;
  String? description;
  int? projectId;
  int? investorId;
  String? createdAt;
  String? updatedAt;

  Complaint(
      {this.id,
        this.description,
        this.projectId,
        this.investorId,
        this.createdAt,
        this.updatedAt});

  Complaint.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    projectId = json['project_id'];
    investorId = json['investor_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['project_id'] = this.projectId;
    data['investor_id'] = this.investorId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
List complaint_list_item = [
  Complaint(
      id: 0, projectId: 0,investorId: 0, description: "يوجد مشكلة في البيانات المقدمة", createdAt: "7-9-2023",updatedAt: "19-5-2024"
  ),
];
class complaintModelForFullInfo {
  String? projectName;
  String? investorName;
  int? id,pId;
  String? updatedAt,createdAt,description;


  complaintModelForFullInfo({this.pId,this.description,this.projectName,this.investorName,this.id,this.updatedAt,this.createdAt});}