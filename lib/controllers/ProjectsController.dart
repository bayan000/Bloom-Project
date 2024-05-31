import 'package:admin/Config/server_config.dart';
import 'package:admin/Services/projects_services.dart';
import 'package:flutter/material.dart';

import '../models/project_list.dart';

class ProjectsController extends ChangeNotifier{
  int? p_id;
  List<Project> projects=[];
  List<Project> projectListSearched=[];
  int status=0;
  var SearchValue,selectedFilter;

  //fetchProjects------------------------------------------
  Future<List<Project>> fetchProjects() async{
    projects=await ProjectsService.getProjects(ServerConfig.getAllProjects);
    return await ProjectsService.getProjects(ServerConfig.getAllProjects);
  }
  //fetchUnacceptedProjects------------------------------------------

  Future<List<Project>> fetchAllUnacceptedProjects() async{
    projects=await ProjectsService.getProjects(ServerConfig.getAllUnacceptedProjects);
    return await ProjectsService.getProjects(ServerConfig.getAllUnacceptedProjects);
  }
  //AddType------------------------------------------
  Future<int> addProjectType(name) async{
    status= await ProjectsService.AddProjectType(ServerConfig.url+ServerConfig.AddNewProjectType, name);
    return status;
  }
//acceptProject------------------------------------------
  Future<int> acceptProject(var id) async{
    status= await ProjectsService.AcceptProject(ServerConfig.url+ServerConfig.AcceptAProject+id.toString());
    return status;
  }
//DeleteProject------------------------------------------
  Future<int> deleteProject(var id) async{
    status= await ProjectsService.DeleteProject(ServerConfig.url+ServerConfig.DeleteAProject+id.toString());
    return status;
  }
  //SearchForProjectsByName------------------------------------
  Future<List<Project>> SearchForProjectsByName(name) async{
    projectListSearched=await ProjectsService.searchForProject(ServerConfig.url+ServerConfig.SearchForAProjectByName+name);
    return projectListSearched;
  }
  //SearchForProjectsByAmount------------------------------------
  Future<List<Project>> SearchForProjectsByAmount(amount) async{
    projectListSearched=await ProjectsService.searchForProject(ServerConfig.url+ServerConfig.SearchForAProjectByAmount+amount.toString());
    return projectListSearched;
  }
  //UpdateSearchValue------------------------------------
  UpdateSearchValue(var value){
    this.SearchValue=value;
    notifyListeners();
    return value;
  }
  Update_selectedFilter(var value){
    this.selectedFilter=value;
    notifyListeners();
    return value;
  }
}
