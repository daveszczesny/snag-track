import 'package:hive/hive.dart';
import 'package:snag_application_1/models/project.dart';
import 'package:snag_application_1/repositories/project/project_repository.dart';

class LocalProjectRepository implements ProjectRepository {
  
  final Box<Project> _projectBox = Hive.box<Project>('projects');

  @override
  Future<void> addProject(Project project) async {
    await _projectBox.add(project);
  }

  @override
  List<Project> getProjects() {
    return _projectBox.values.toList();
  }

  @override
  Project? getProject(Project project) {
    return _projectBox.getAt(_projectBox.keyAt(project.key()));
  }

  @override
  Future<void> updateProject(Project project) async {
    await _projectBox.putAt(_projectBox.keyAt(project.key!), project);
  }

  @override
  Future<void> deleteProject(Project project) async {
    await _projectBox.deleteAt(_projectBox.keyAt(project.key!));
  }

  @override
  Future<void> deleteAllProjects() async {
    await _projectBox.clear();
  }

  Future<void> closeBox() async {
    await _projectBox.close();
  }
  
}

final ProjectRepository projectRepository = LocalProjectRepository();