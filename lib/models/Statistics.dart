
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

class ReportsStatistics {
  String? month;
  int? totalNetProfit;
  int? totalNetProfitEmployer;
  int? totalNetProfitInvestor;
  int? totalRevenue;

  ReportsStatistics(
      {this.month,
        this.totalNetProfit,
        this.totalNetProfitEmployer,
        this.totalNetProfitInvestor,
        this.totalRevenue});

  ReportsStatistics.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    totalNetProfit = json['total_net_profit'];
    totalNetProfitEmployer = json['total_net_profit_employer'];
    totalNetProfitInvestor = json['total_net_profit_investor'];
    totalRevenue = json['total_revenue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['total_net_profit'] = this.totalNetProfit;
    data['total_net_profit_employer'] = this.totalNetProfitEmployer;
    data['total_net_profit_investor'] = this.totalNetProfitInvestor;
    data['total_revenue'] = this.totalRevenue;
    return data;
  }
}