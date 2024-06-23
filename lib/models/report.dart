class Reports {
  List<Report>? report;
  String? message;
  int? status;

  Reports({this.report, this.message, this.status});

  Reports.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      report = <Report>[];
      json['data'].forEach((v) {
        report!.add(new Report.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.report != null) {
      data['data'] = this.report!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Report {
  int? id;
  String? reportTitle;
  String? achievedGoalsSummary;
  String? unachievedGoalsSummary;
  String? investorAmount;
  String? totalRevenue;
  String? totalCosts;
  String? netProfit;
  String? netProfitEmployer;
  String? netProfitInvestor;
  String? receivedMaterials;
  String? materialPrice;
  String? totalSales;
  String? overallNetProfit;
  String? maintenanceAmount;
  String? wagesAndTransactionsAmount;
  String? mainRecommendations;
  int? projectId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  String? projectName;

  Report(
      {this.projectName,
        this.id,
        this.reportTitle,
        this.achievedGoalsSummary,
        this.unachievedGoalsSummary,
        this.investorAmount,
        this.totalRevenue,
        this.totalCosts,
        this.netProfit,
        this.netProfitEmployer,
        this.netProfitInvestor,
        this.receivedMaterials,
        this.materialPrice,
        this.totalSales,
        this.overallNetProfit,
        this.maintenanceAmount,
        this.wagesAndTransactionsAmount,
        this.mainRecommendations,
        this.projectId,
        this.userId,
        this.createdAt,
        this.updatedAt});

  Report.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reportTitle = json['report_title'];
    achievedGoalsSummary = json['achieved_goals_summary'];
    unachievedGoalsSummary = json['unachieved_goals_summary'];
    investorAmount = json['investor_amount'];
    totalRevenue = json['total_revenue'];
    totalCosts = json['total_costs'];
    netProfit = json['net_profit'];
    netProfitEmployer = json['net_profit_employer'];
    netProfitInvestor = json['net_profit_investor'];
    receivedMaterials = json['received_materials'];
    materialPrice = json['material_price'];
    totalSales = json['total_sales'];
    overallNetProfit = json['overall_net_profit'];
    maintenanceAmount = json['maintenance_amount'];
    wagesAndTransactionsAmount = json['wages_and_transactions_amount'];
    mainRecommendations = json['main_recommendations'];
    projectId = json['project_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['report_title'] = this.reportTitle;
    data['achieved_goals_summary'] = this.achievedGoalsSummary;
    data['unachieved_goals_summary'] = this.unachievedGoalsSummary;
    data['investor_amount'] = this.investorAmount;
    data['total_revenue'] = this.totalRevenue;
    data['total_costs'] = this.totalCosts;
    data['net_profit'] = this.netProfit;
    data['net_profit_employer'] = this.netProfitEmployer;
    data['net_profit_investor'] = this.netProfitInvestor;
    data['received_materials'] = this.receivedMaterials;
    data['material_price'] = this.materialPrice;
    data['total_sales'] = this.totalSales;
    data['overall_net_profit'] = this.overallNetProfit;
    data['maintenance_amount'] = this.maintenanceAmount;
    data['wages_and_transactions_amount'] = this.wagesAndTransactionsAmount;
    data['main_recommendations'] = this.mainRecommendations;
    data['project_id'] = this.projectId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}