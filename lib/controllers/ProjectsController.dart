import 'package:admin/Config/server_config.dart';
import 'package:admin/Services/projects_services.dart';
import 'package:flutter/material.dart';

import '../models/project_list.dart';

class ProjectsController extends ChangeNotifier{
  int? p_id;
  List<Project> projects=[];
  int status=0;

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
//acceptProjects------------------------------------------
  Future<int> acceptProject(var id) async{
    status= await ProjectsService.AcceptProject(ServerConfig.url+ServerConfig.AcceptAProject+id.toString());
    return status;
  }

}
