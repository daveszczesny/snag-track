import 'package:flutter/material.dart';
import 'package:snag_application_1/models/project.dart';
import 'package:snag_application_1/ui/screens/project/project_detail_view.dart';
import 'package:snag_application_1/ui/screens/project/project_snag_view.dart';
import 'package:snag_application_1/ui/screens/snag_create_form_screen.dart';

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
      SnagCreateFormScreen(
        project: widget.project,
        onSnagCreated: () {
          setState(() {
            _selectedIndex = 2;
          });
        }
      ),
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
            icon: ImageIcon(
              const AssetImage('lib/assets/icons/png/details_icon.png'),
              size: 20,
              ), label: 'Details',
            ),
          NavigationDestination(
            icon: Icon(
              _selectedIndex == 1 ? Icons.add : Icons.add_outlined,
              ), label: 'Add',
            ),
          NavigationDestination(
            icon: ImageIcon(
              const AssetImage('lib/assets/icons/png/snag_icon.png'),
              size: 20,
              ), label: 'Snags',
            ),
        ],
      ),
    );
  }
}