
class MonthlyStatistics {
  String? month;
  int? users;
  int? investors;

  MonthlyStatistics({this.month, this.users, this.investors});

  MonthlyStatistics.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    users = json['users'];
    investors = json['investors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['users'] = this.users;
    data['investors'] = this.investors;
    return data;
  }
}


class ProjectStatistics {
  String? month;
  int? totalProjects;
  int? fundedProjects;

  ProjectStatistics({this.month, this.totalProjects, this.fundedProjects});

  ProjectStatistics.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    totalProjects = json['total_projects'];
    fundedProjects = json['funded_projects'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['total_projects'] = this.totalProjects;
    data['funded_projects'] = this.fundedProjects;
    return data;
  }
}