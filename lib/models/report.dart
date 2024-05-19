/*"id": 1,
            "عنوان_التقرير": "dcdddd",
            "ملخص_الأهداف_المحققة": "kkkkkkk",
            "ملخص_الأهداف_غير_المحققة": "iiiii",
            "مبلغ_المستثمر": "99999.00",
            "الإيرادات_الإجمالية": "9.00",
            "التكاليف_الإجمالية": "9898.00",
            "الأرباح_الصافية": "989.00",
            "الصافي_الربح_لصاحب_العمل": "98989.00",
            "الصافي_الربح_للمستثمر": "9090.00",
            "المواد_المستلمة": "jhjhj",
            "سعر_المواد": "656.00",
            "إجمالي_المبيعات": "878.00",
            "صافي_الربح_الكلي": "89.00",
            "مبلغ_الصيانة": "545.00",
            "مبلغ_الأجور_والمعاملات": "8989.00",
            "التوصيات_الرئيسية": "jkjk",
            "project_id": 3,
            "user_id": 3,
            "created_at": "2024-05-14T19:37:46.000000Z",
            "updated_at": "2024-05-14T19:37:46.000000Z"*/
class report{
  final String? title,acheivedObjectives,unacheivedObjectives,investmentPayment,
      Revenues, suppliedMaterials, MaterialsPrice, SumOfSails, SumOfProfits,maintainancePayement,
      Amount_of_wages_and_transactions,essintialRecommendations,created_at,updated_at;
  int project_id,user_id;
  report( {this.title, this.acheivedObjectives, this.unacheivedObjectives,
    this.investmentPayment, this.Revenues, this.suppliedMaterials, this.MaterialsPrice,
    this.SumOfSails, this.SumOfProfits, this.maintainancePayement, this.Amount_of_wages_and_transactions,
    this.essintialRecommendations, this.created_at, this.updated_at,
    required this.project_id,
    required this.user_id,

});
}
List report_list_item = [
  report(
    title: "تقرير التنفيذ",
    acheivedObjectives: "ملخص_الأهداف_المحققة",
    unacheivedObjectives: "ملخص_الأهداف_غير_المحققة",
    investmentPayment: "مبلغ_المستثمر",Revenues:"الأرباح_الصافية",
    suppliedMaterials: "المواد_المستلمة",
    MaterialsPrice: "سعر_المواد",
    SumOfSails: "إجمالي_المبيعات",
    SumOfProfits: "صافي_الربح_الكلي",
    maintainancePayement: "مبلغ_الصيانة",
    Amount_of_wages_and_transactions: "مبلغ_الأجور_والمعاملات",
    essintialRecommendations: "التوصيات_الرئيسية",
    created_at:"2024-05-14T19:37:46.000000Z",
    updated_at: "2024-05-14T19:37:46.000000Z",
    project_id: 3,
    user_id:3
  ),
];


