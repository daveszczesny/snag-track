import 'package:snag_application_1/models/project.dart';
import 'package:snag_application_1/repositories/project/local_project_repository.dart';
import 'package:snag_application_1/repositories/project/project_repository.dart';

class ProjectController {
  final ProjectRepository _projectRepository = LocalProjectRepository();

  Future<void> addProject(Project project) async {
    await _projectRepository.addProject(project);
  }

  List<Project> getProjects() {
    return _projectRepository.getProjects();
  }

  Future<void> deleteProject(Project project) async {
    await _projectRepository.deleteProject(project);
  }
}

final projectController = ProjectController();