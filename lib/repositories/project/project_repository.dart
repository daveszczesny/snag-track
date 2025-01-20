import 'package:snag_application_1/models/project.dart';

abstract class ProjectRepository{
  Future<void> addProject(Project project);
  List<Project> getProjects();
  Project? getProject(Project project);
  Future<void> deleteProject(Project project);
  Future<void> updateProject(Project project);
  Future<void> deleteAllProjects();
}