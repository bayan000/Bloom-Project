class TransactionsForEachProject {
  String? status;
  List<Tran>? trans;

  TransactionsForEachProject({this.status, this.trans});

  TransactionsForEachProject.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      trans = <Tran>[];
      json['data'].forEach((v) {
        trans!.add(new Tran.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.trans != null) {
      data['data'] = this.trans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tran {
  Transaction? transaction;
  Null? receipt;

  Tran({this.transaction, this.receipt});

  Tran.fromJson(Map<String, dynamic> json) {
    transaction = json['transaction'] != null
        ? new Transaction.fromJson(json['transaction'])
        : null;
    receipt = json['receipt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transaction != null) {
      data['transaction'] = this.transaction!.toJson();
    }
    data['receipt'] = this.receipt;
    return data;
  }
}

class Transaction {
  int? id;
  String? name;
  String? pName;
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
        this.pName,
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