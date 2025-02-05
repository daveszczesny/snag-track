import 'dart:io';

import 'package:flutter/material.dart';
import 'package:snag_application_1/models/project.dart';
import 'package:snag_application_1/ui/screens/project_view_screen.dart';

class ProjectCardWidget extends StatefulWidget {
  final Project project;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  const ProjectCardWidget({
    super.key,
    required this.project,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  _ProjectCardWidgetState createState() => _ProjectCardWidgetState();
}

class _ProjectCardWidgetState extends State<ProjectCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProjectViewScreen(project: widget.project)),
      );
      },
      onLongPress: () {
        widget.onSelected(!widget.isSelected);
      },
      child: Card(
        color: widget.isSelected ? Colors.blue.withOpacity(0.5) : Colors.white,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.grey,
                child: widget.project.logoImage != null
                  ? Image.file(
                    File(widget.project.logoImage!.path),
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                  : const Icon(Icons.image, color: Colors.white),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.project.name,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 8.0),
                    widget.project.snags.isEmpty
                      ? const Text('No snags found')
                      : LinearProgressIndicator(
                        value: widget.project.totalResolvedSnags / widget.project.totalSnags,
                      ),

                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              PopupMenuButton<String>(
                onSelected: (value) {
                  // Handle menu actions
                },
                // Quick acitons a selected project
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem<String>(
                      value: 'View project',
                      child: const Text('View project'),
                    ),
                    PopupMenuItem<String>(
                      value: 'Share project',
                      child: const Text('Share project'),
                    ),
                    PopupMenuItem<String>(
                      value: 'Edit project',
                      child: const Text('Edit project'),
                    ),
                    const PopupMenuDivider(
                      height: 1.0,
                    ),
                    PopupMenuItem<String>(
                      value: 'Delete project',
                      child: Text('Delete project', style: TextStyle(color: Colors.red)),
                    ),
                  ];
                },
              )
            ]
          )
        )
      )
    );
  }
}