import 'package:flutter/material.dart';
import 'package:snag_application_1/models/project.dart';
import 'package:snag_application_1/ui/screens/project/project_detail_view.dart';
import 'package:snag_application_1/ui/screens/project/project_snag_view.dart';

class ProjectViewScreen extends StatefulWidget {
  final Project project;


  const ProjectViewScreen({super.key, required this.project});
  @override
  _ProjectViewScreenState createState() => _ProjectViewScreenState();
}

class _ProjectViewScreenState extends State<ProjectViewScreen> {

  int _selectedIndex = 0;
  Project? selectedProject;

  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      ProjectDetailView(project: widget.project),
      ProjectSnagView(project: widget.project),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.project.name),
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => setState(() => _selectedIndex = index),
        destinations: [
          NavigationDestination(
            icon: Icon(
              _selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined,
              ), label: 'Details',
            ),
          NavigationDestination(
            icon: Icon(
              _selectedIndex == 1 ? Icons.search : Icons.search_outlined,
              ), label: 'Snags',
            ),
        ],
      ),
    );
  }
}