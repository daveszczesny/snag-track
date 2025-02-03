import 'package:flutter/material.dart';
import 'package:snag_application_1/models/project.dart';

class ProjectDetailView extends StatefulWidget {
  final Project project;

  const ProjectDetailView({super.key, required this.project});

  @override
  _ProjectDetailViewState createState() => _ProjectDetailViewState();
}

class _ProjectDetailViewState extends State<ProjectDetailView> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(38.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${widget.project.description}',
              style: const TextStyle(fontSize: 16),
            ),
            // Add more project details here
          ],
        ),
      ),
    );
  }
}