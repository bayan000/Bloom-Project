import 'package:admin/Config/server_config.dart';
import 'package:admin/Services/projects_services.dart';
import 'package:flutter/material.dart';

import '../models/project_list.dart';

class ProjectsController extends ChangeNotifier{

  List<Project> projects=[];
  Future<List<Project>> fetchProjects() async{
    projects=await ProjectsService.getProjects(ServerConfig.getAllProjects);
    return await ProjectsService.getProjects(ServerConfig.getAllProjects);
  }

}
