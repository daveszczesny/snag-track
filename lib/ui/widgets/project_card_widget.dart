import 'package:flutter/material.dart';
import 'package:snag_application_1/models/project.dart';

class ProjectCardWidget extends StatelessWidget {
  final Project project;

  const ProjectCardWidget({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Image on the left-hand side
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: project.logoImage != null
                      ? NetworkImage(project.logoImage!)
                      : AssetImage('') as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16.0),
            // Text on the right-hand side
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.name,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    project.location ?? 'No location',
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    project.client ?? 'No client',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}