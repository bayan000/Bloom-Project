class ServerConfig{
  //flutter run -d chrome --web-browser-flag "--disable-web-security"

  static String url = "https://grad2222.000webhostapp.com/api/";
  //static String url = "https://noor-demo-store.webmyidea.com/api/";
  /***********************************************************/
  //Authorization----
  static String logIn = "admin/login";
  static String logOut = "admin/logout";

  //Projects---------'
  static String getAllUnacceptedProjects = "admin/projects";
  static String getAllProjects = "projects/";
  static String getAProject = "projects/";
  static String AddNewProjectType = "admin/Type";
  static String AcceptAProject = "admin/projects/acceptProject/";
  static String DeleteAProject = "projects/delete/";
  static String SearchForAProjectByName = "projects/Name/";
  static String SearchForAProjectByAmount = "projects/Amount/";
  static String getAProjectTransactions = "Transaction/";


  //Articles---------
  static String getAllArticles = "Article";
  static String getAnArticle = "Article/";
  static String AddAnArticle = "admin/Article";
  static String DeleteAnArticle = "admin/Article/delete/";

  //Investors--------
  static String getAllInvestors = "admin/investors";
  static String getAnInvestor = "admin/investors/showForAdmin/";

  //Workers----------
  static String getAllWorkers = "admin/users/";
  static String getAWorker = "admin/users/showForAdmin/";

  //CommunicationRequests----------
  static String getAllCommunicationRequests = "admin/communications/";
  static String getACommunicationRequest = "admin/communications/";
  static String acceptCommunicationRequests ="admin/communications/acceptRequest/";

  //Complaints----------
  static String getComplaints = "admin/complaints/";
  static String deleteComplaint = "admin/complaints/delete/";

  //Transactions
  static String getTransactions="admin/Transaction";
  static String AddATransaction="admin/Transaction";
  static String UpdateATransaction="admin/Transaction/update/";
  static String DeleteATransaction="admin/Transaction/delete/";

  //TransactionsRequests
  static String getTransactionsRequests="admin/Transaction/review-requests";
  //https://grad2222.000webhostapp.com/api/admin/Transaction/3/approve
  static String ApproveTransactionsRequests0="admin/Transaction/";
  static String ApproveTransactionsRequests1="/approve";
  static String getATransactionsRequest="admin/Transaction/review-requests/";

  //TransactionsRequests
  static String getApprovedTransactions="admin/Transaction/showAccepted";

  //Statistic
  static String monthly_statistics="monthly-statistics";
  static String project_statistics="project-statistics";


  //Reports
  static String getRreports="admin/reports/";
  //https://grad2222.000webhostapp.com/api/admin/reports/1/1
  static String getARreport="admin/reports/";
  static String getAProjectRreports="reports/";// /id
/*{
    "data": [
        {
            "id": 1,
            "report_title": "dcdddd",
            "achieved_goals_summary": "kkkkkkk",
            "unachieved_goals_summary": "iiiii",
            "investor_amount": "99999.00",
            "total_revenue": "9.00",
            "total_costs": "9898.00",
            "net_profit": "989.00",
            "net_profit_employer": "98989.00",
            "net_profit_investor": "9090.00",
            "received_materials": "jhjhj",
            "material_price": "656.00",
            "total_sales": "878.00",
            "overall_net_profit": "89.00",
            "maintenance_amount": "545.00",
            "wages_and_transactions_amount": "8989.00",
            "main_recommendations": "تتتتتتتتتتتتتت",
            "project_id": 1,
            "user_id": 1,
            "created_at": "2024-05-20T09:53:03.000000Z",
            "updated_at": "2024-05-20T09:53:03.000000Z"
        },
        {
            "id": 2,
            "report_title": "dcdddd",
            "achieved_goals_summary": "kkkkkkk",
            "unachieved_goals_summary": "iiiii",
            "investor_amount": "99999.00",
            "total_revenue": "9.00",
            "total_costs": "9898.00",
            "net_profit": "989.00",
            "net_profit_employer": "98989.00",
            "net_profit_investor": "9090.00",
            "received_materials": "jhjhj",
            "material_price": "656.00",
            "total_sales": "878.00",
            "overall_net_profit": "89.00",
            "maintenance_amount": "545.00",
            "wages_and_transactions_amount": "8989.00",
            "main_recommendations": "تتتتتتتتتتتتتت",
            "project_id": 1,
            "user_id": 1,
            "created_at": "2024-05-20T09:54:21.000000Z",
            "updated_at": "2024-05-20T09:54:21.000000Z"
        }
    ],
    "message": "OK",
    "status": 200
}*/

}
