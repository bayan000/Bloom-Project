import 'package:admin/Config/server_config.dart';
import 'package:admin/Services/projects_services.dart';
import 'package:flutter/material.dart';

import '../models/project_list.dart';

class ProjectsController extends ChangeNotifier{

  List<Project> projects=[];
  int status=0;
  Future<List<Project>> fetchProjects() async{
    projects=await ProjectsService.getProjects(ServerConfig.getAllProjects);
    return await ProjectsService.getProjects(ServerConfig.getAllProjects);
  }
  Future<int> addProjectType(name) async{
    status= await ProjectsService.AddProjectType(ServerConfig.url+ServerConfig.AddNewProjectType, name);
    return status;
  }

}
