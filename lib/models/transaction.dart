class Transactions {
  List<Transaction>? transaction;
  String? message;
  int? status;

  Transactions({this.transaction, this.message, this.status});

  Transactions.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      transaction = <Transaction>[];
      json['data'].forEach((v) {
        transaction!.add(new Transaction.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transaction != null) {
      data['data'] = this.transaction!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Transaction {
  int? id;
  String? name;
  String? description;
  String? price;
  String? discount;
  String? status;
  int? projectId;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Transaction(
      {this.id,
        this.name,
        this.description,
        this.price,
        this.discount,
        this.status,
        this.projectId,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    status = json['status'];
    projectId = json['project_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['status'] = this.status;
    data['project_id'] = this.projectId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}