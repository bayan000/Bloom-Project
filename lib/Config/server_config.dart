class ServerConfig{
  static String url = "https://grad2222.000webhostapp.com/api/";
  /***********************************************************/
  //Authorization----
  static String logIn = "admin/login";
  static String logOut = "admin/logout";

  //Projects---------
  static String getAllUnacceptedProjects = "admin/projects";
  static String getAllProjects = "projects/";
  static String getAProject = "projects/";
  static String AddNewProjectType = "admin/Type";
  static String AcceptAProject = "admin/projects/acceptProject/";
  static String DeleteAProject = "projects/delete/";
  static String SearchForAProjectByName = "projects/Name/";
  static String SearchForAProjectByAmount = "projects/Amount/";

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
  static String acceptCommunicationRequests ="admin/communications/acceptRequest/";
  //Complaints----------
  static String getComplaints = "admin/complaints/";
  static String deleteComplaint = "admin/complaints/delete/";


}
