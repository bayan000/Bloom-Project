/*import 'dart:convert';
import 'package:admin/Config/server_config.dart';
import 'package:admin/controllers/ProjectsController.dart';
import 'package:admin/controllers/aninvestorController.dart';
import 'package:admin/controllers/workerInfoController.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/CommunicationRequestsController.dart';
import '../models/ProjectDetails.dart';
import '../models/TransactionsForEachProject.dart';
import '../models/project_list.dart';
import 'package:http/http.dart' as http;


class ProjectsService{
  //********************* Fetching Projects *********************************//

  static Future<List<Project>> getProjects(String url1) async {
    ProjectsController projectsController=ProjectsController();
    final response = await http.get(Uri.parse(ServerConfig.url+"admin/projects"),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });

    if (response.statusCode == 200) {
      print("hey hey hey");
      final jsonBody = json.decode(response.body) as Map<String, dynamic>;
      final projectsData = jsonBody['data'] as List<dynamic>;
      final projects = projectsData.map((projectData) => Project.fromJson(projectData)).toList();
      print("here");
      print(response.body);
      /*for(int i=0;i<projects.length;i++)
        {
          await projectsController.fetchProjectTypeName(2);
          print(projects[i].pType!);
        }*/

      print("here too");

      return projects;
    } else {
      //print(response.body);
      print(response.reasonPhrase);

      print(response.statusCode.toString() +" fetching projects");
      throw Exception('Failed to fetch projects');
    }
  }
  static Future<List<Project>> getUnacceptedProjects(String url1) async {
    ProjectsController projectsController=ProjectsController();
    final response = await http.get(Uri.parse(ServerConfig.url+"admin/projects"),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });

    if (response.statusCode == 200) {
      print("hey hey hey");
      final jsonBody = json.decode(response.body) as Map<String, dynamic>;
      final projectsData = jsonBody['data'] as List<dynamic>;
      final projects = projectsData.map((projectData) => Project.fromJson(projectData)).toList();
      print("here");
      print(response.body);
      /*for(int i=0;i<projects.length;i++)
        {
          await projectsController.fetchProjectTypeName(2);
          print(projects[i].pType!);
        }*/

      print("here too");

      return projects;
    } else {
      //print(response.body);
      print(response.reasonPhrase);

      print(response.statusCode.toString() +" fetching projects");
      throw Exception('Failed to fetch projects');
    }
  }

//********************* Adding Project Type *********************************//
  static Future<int> AddProjectType(String url, String name) async {
    final Map<String, dynamic> body = {'name': name};

    final response = await http.post(Uri.parse(url), body: jsonEncode(body),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });
    print(response.body);

    if (response.statusCode == 201) {

      return response.statusCode;

    } else {
      print("Unknown error");
      return 0;
    }

  }

//********************* Fetching a Project Details *********************************//

  static Future<ProjectDetailsWithCanvases> fetchAProjectDetails(String url) async {
    InvestorController investorController=InvestorController();
    WorkerInfoController workerInfoController=WorkerInfoController();
    ProjectsController projectsController=ProjectsController();
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });
    if (response.statusCode == 200) {
      print("it's okay");
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final invname=await investorController.fetchInvestorName(ProjectDetailsWithCanvases.fromJson(json).data!.investorId);
      ProjectDetailsWithCanvases projectDetailsWithCanvases=ProjectDetailsWithCanvases();
      projectDetailsWithCanvases=ProjectDetailsWithCanvases.fromJson(json);
      projectDetailsWithCanvases.data!.invName=invname;
      final wName= await workerInfoController.fetchWorkerName(ProjectDetailsWithCanvases.fromJson(json).data!.userId);
      projectDetailsWithCanvases.data!.wName=wName;
      //projectDetailsWithCanvases.data!.pType=await projectsController.fetchProjectTypeName(ProjectDetailsWithCanvases.fromJson(json).data!.typeId);
      return projectDetailsWithCanvases;
    } else {
      print("it's okay too");
      throw Exception('Failed to fetch Project Details: ${response.statusCode}');
    }
  }
//********************* Accept Project *********************************//

  static Future<int> AcceptProject(String url) async {

    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
//'content-Type':'application/json',
      'Accept':'application/json',
    });
    print(response.body);

    if (response.statusCode == 200) {

      return response.statusCode;

    } else {
      print("Unknown error");
      return 0;
    }



  }

//********************* Deleting Project *********************************//

  static Future<int> DeleteProject(String url) async {

    final response = await http.post(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'Accept':'application/json',
    });
    print(response.body);

    if (response.statusCode == 200) {

      return response.statusCode;

    } else {
      print("Unknown error");
      return 0;
    }



  }

//********************* searchForProject *********************************//

  static Future<List<Project>> searchForProject(String url) async {
    final response = await http.get(Uri.parse(url
    ),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body) as Map<String, dynamic>;
      final projectsData = jsonBody['data'] as List<dynamic>;
      final projects = projectsData.map((projectData) => Project.fromJson(projectData)).toList();
      return projects;
    } else {
      throw Exception('Failed to fetch projects: ${response.statusCode}');
    }
  }

//********************* fetch Project Transactions *********************************//

  static Future<TransactionsForEachProject> fetchProjectTransactions(String url) async {
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body) as Map<String, dynamic>;
      if (decodedData['status'] == 'success') {
        final dataList = decodedData['data'] as List<dynamic>;
        final transactions = dataList.map((data) => Tran.fromJson(data)).toList();
        CommunicationRequestsController communicationRequestsController=CommunicationRequestsController();
        for(int i=0; i<transactions.length; i++){
          final name=await communicationRequestsController.getProjectName(transactions[i].transaction!.projectId);
          transactions[i].transaction!.pName=name;
        }
        return TransactionsForEachProject(status: decodedData['status'], trans: transactions);
      }
      else {
        throw Exception('Failed to fetch transactions. Status code: ${response.statusCode}');
      }
    } else {
      throw Exception('Failed to fetch transactions. Status code: ${response.statusCode}');
    }
  }
//********************* fetchProjectTypeName *********************************//

  static Future<String> fetchProjectTypeName(String url) async {
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final data = json['data'] as Map<String, dynamic>;
      print(data['name']);
      return data['name'] as String;
    } else {
      // Handle error scenario (e.g., throw an exception)
      print(response.body);
      throw Exception('Failed to fetch project type name. Status code: ${response.statusCode}');
    }
  }


}
*/
import 'dart:convert';
import 'package:admin/Config/server_config.dart';
import 'package:admin/controllers/ProjectsController.dart';
import 'package:admin/controllers/aninvestorController.dart';
import 'package:admin/controllers/workerInfoController.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/CommunicationRequestsController.dart';
import '../models/ProjectDetails.dart';
import '../models/TransactionsForEachProject.dart';
import '../models/project_list.dart';
import 'package:http/http.dart' as http;


class ProjectsService{
  //********************* Fetching Projects *********************************//

  static Future<List<Project>> getProjects(String url) async {
    ProjectsController projectsController=ProjectsController();
    final response = await http.get(Uri.parse(ServerConfig.url+url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });

    if (response.statusCode == 200) {
      print("hey hey hey");
      final jsonBody = json.decode(response.body) as Map<String, dynamic>;
      final projectsData = jsonBody['data'] as List<dynamic>;
      final projects = projectsData.map((projectData) => Project.fromJson(projectData)).toList();
      print("here");
      print(response.body);
      /*for(int i=0;i<projects.length;i++)
        {
          await projectsController.fetchProjectTypeName(2);
          print(projects[i].pType!);
        }*/

      print("here too");

      return projects;
    } else {
      print(response.body);
      throw Exception('Failed to fetch projects');
    }
  }
//********************* Adding Project Type *********************************//
  static Future<int> AddProjectType(String url, String name) async {
    final Map<String, dynamic> body = {'name': name};

    final response = await http.post(Uri.parse(url), body: jsonEncode(body),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });
    print(response.body);

    if (response.statusCode == 201) {

      return response.statusCode;

    } else {
      print("Unknown error");
      return 0;
    }

  }

//********************* Fetching a Project Details *********************************//

  static Future<ProjectDetailsWithCanvases> fetchAProjectDetails(String url) async {
    InvestorController investorController=InvestorController();
    WorkerInfoController workerInfoController=WorkerInfoController();
    ProjectsController projectsController=ProjectsController();
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });
    if (response.statusCode == 200) {
      print("it's okay");
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final invname=await investorController.fetchInvestorName(ProjectDetailsWithCanvases.fromJson(json).data!.investorId);
      ProjectDetailsWithCanvases projectDetailsWithCanvases=ProjectDetailsWithCanvases();
      projectDetailsWithCanvases=ProjectDetailsWithCanvases.fromJson(json);
      projectDetailsWithCanvases.data!.invName=invname;
      final wName= await workerInfoController.fetchWorkerName(ProjectDetailsWithCanvases.fromJson(json).data!.userId);
      projectDetailsWithCanvases.data!.wName=wName;
      //projectDetailsWithCanvases.data!.pType=await projectsController.fetchProjectTypeName(ProjectDetailsWithCanvases.fromJson(json).data!.typeId);
      return projectDetailsWithCanvases;
    } else {
      print("it's okay too");
      throw Exception('Failed to fetch Project Details: ${response.statusCode}');
    }
  }
//********************* Accept Project *********************************//

  static Future<int> AcceptProject(String url) async {

    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
//'content-Type':'application/json',
      'Accept':'application/json',
    });
    print(response.body);

    if (response.statusCode == 200) {

      return response.statusCode;

    } else {
      print("Unknown error");
      return 0;
    }



  }

//********************* Deleting Project *********************************//

  static Future<int> DeleteProject(String url) async {

    final response = await http.post(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'Accept':'application/json',
    });
    print(response.body);

    if (response.statusCode == 200) {

      return response.statusCode;

    } else {
      print("Unknown error");
      return 0;
    }



  }

//********************* searchForProject *********************************//

  static Future<List<Project>> searchForProject(String url) async {
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body) as Map<String, dynamic>;
      final projectsData = jsonBody['data'] as List<dynamic>;
      final projects = projectsData.map((projectData) => Project.fromJson(projectData)).toList();
      return projects;
    } else {
      throw Exception('Failed to fetch projects: ${response.statusCode}');
    }
  }

//********************* fetch Project Transactions *********************************//

  static Future<TransactionsForEachProject> fetchProjectTransactions(String url) async {
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });

    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body) as Map<String, dynamic>;
      if (decodedData['status'] == 'success') {
        final dataList = decodedData['data'] as List<dynamic>;
        final transactions = dataList.map((data) => Tran.fromJson(data)).toList();
        CommunicationRequestsController communicationRequestsController=CommunicationRequestsController();
        for(int i=0; i<transactions.length; i++){
          final name=await communicationRequestsController.getProjectName(transactions[i].transaction!.projectId);
          transactions[i].transaction!.pName=name;
        }
        return TransactionsForEachProject(status: decodedData['status'], trans: transactions);
      }
      else {
        throw Exception('Failed to fetch transactions. Status code: ${response.statusCode}');
      }
    } else {
      throw Exception('Failed to fetch transactions. Status code: ${response.statusCode}');
    }
  }
//********************* fetchProjectTypeName *********************************//

  static Future<String> fetchProjectTypeName(String url) async {
    final response = await http.get(Uri.parse(url),headers: {
      'Authorization':'Bearer  ${GetStorage().read('token')}',
      'content-Type':'application/json',
    });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final data = json['data'] as Map<String, dynamic>;
      print(data['name']);
      return data['name'] as String;
    } else {
      // Handle error scenario (e.g., throw an exception)
      print(response.body);
      throw Exception('Failed to fetch project type name. Status code: ${response.statusCode}');
    }
  }


}






