import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:snag_application_1/models/project.dart';
import 'package:snag_application_1/ui/widgets/project_card_widget.dart';
import 'package:snag_application_1/ui/widgets/project_list_tab_widget.dart';

class ProjectListScreen extends StatefulWidget {
  const ProjectListScreen({Key? key}) : super(key: key);

  @override
  _ProjectListScreenState createState() => _ProjectListScreenState();
}

class _ProjectListScreenState extends State<ProjectListScreen> with SingleTickerProviderStateMixin{

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Future<void> _openBox() async {
    await Hive.openBox<Project>('projects');
  }

  final Set<Project> _selectedProjects = {};

  void _onProjectSelected(Project project, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedProjects.add(project);
      } else {
        _selectedProjects.remove(project);
      }
    });
  }

  List<Project> _filterProjects(String filter) {
    var projectBox = Hive.box<Project>('projects');
    switch (filter) {
      case 'Recent':
        // implement recent logic
        List<Project> projects = projectBox.values.toList();
        projects.sort((a, b) => (b.lastModified ?? DateTime(1970)).compareTo(a.lastModified ?? DateTime(1970)));
        return projects;
      case 'Completed':
        // implement completed logic
        return projectBox.values.where((project) => project.isCompleted).toList();
      case 'All':
      default:
        return projectBox.values.toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _openBox(),

      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Projects'),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: ProjectListTabWidget(tabController: _tabController),
              )
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('My Projects'),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: ProjectListTabWidget(tabController: _tabController),
              )
            ),
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            )
          );
        } else {
          
          var projectBox = Hive.box<Project>('projects');
          if (projectBox.isEmpty) {
            return Scaffold(
              appBar: AppBar(
              title: const Text('My Projects'),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: ProjectListTabWidget(tabController: _tabController),
              )
            ),
              body: const Center(
                child: Text("No projects found"),
              )
            );
          } else {
             return Scaffold(
              appBar: AppBar(
              title: const Text('My Projects'),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: ProjectListTabWidget(tabController: _tabController),
              )
            ),
              body: ListView.builder(
                itemCount: projectBox.length,
                itemBuilder: (context, index) {
                  Project project = projectBox.getAt(index)!;
                  bool isSelected = _selectedProjects.contains(project);
                  return ProjectCardWidget(
                    project: project,
                    isSelected: isSelected,
                    onSelected: (isSelected) => _onProjectSelected(project, isSelected),
                  );
                },
                
              ),
            );
          }
        }
      }
    );
  }
}