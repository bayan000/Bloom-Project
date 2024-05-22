class Articles {
  List<Article>? article;
  String? message;
  int? status;

  Articles({this.article, this.message, this.status});

  Articles.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      article = <Article>[];
      json['data'].forEach((v) {
        article!.add(new Article.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.article != null) {
      data['data'] = this.article!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Article {
  int? id;
  String? name;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;

  Article(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.createdAt,
        this.updatedAt});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
List Artiles_list_Item=[
  Article(id: 0,
  name: "الاستثمارات العقارية",
  )
];

