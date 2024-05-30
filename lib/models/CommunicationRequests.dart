class CommunicationRequests {
  List<CommunicationRequest>? communicationRequest;
  String? message;
  int? status;

  CommunicationRequests({this.communicationRequest, this.message, this.status});

  CommunicationRequests.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      communicationRequest = <CommunicationRequest>[];
      json['data'].forEach((v) {
        communicationRequest!.add(new CommunicationRequest.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.communicationRequest != null) {
      data['data'] = this.communicationRequest!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class CommunicationRequest {
  int? id;
  int? projectId;
  int? investorId;
  int? status;
  String? createdAt;
  String? updatedAt;

  CommunicationRequest(
      {this.id,
        this.projectId,
        this.investorId,
        this.status,
        this.createdAt,
        this.updatedAt});

  CommunicationRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    projectId = json['project_id'];
    investorId = json['investor_id'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['project_id'] = this.projectId;
    data['investor_id'] = this.investorId;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
class CommunicationRequestModelForFullInfo {
  String? projectName;
  String? investorName;
  int? id,status;
  String? updatedAt,createdAt;


  CommunicationRequestModelForFullInfo({this.status,this.projectName,this.investorName,this.id,this.updatedAt,this.createdAt});}