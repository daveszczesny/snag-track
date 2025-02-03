import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:snag_application_1/models/project.dart';
import 'package:snag_application_1/models/snag.dart';
import 'package:snag_application_1/models/status.dart';
import 'package:snag_application_1/repositories/project/local_project_repository.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  Future<void> _openBoxes() async {
    await Hive.openBox<Status>('statuses');
    await Hive.openBox<Snag>('snags');
    await Hive.openBox<Project>('projects');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _openBoxes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Snag Application'),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Snag Application'),
            ),
            body: Center(
              child: Text('Error: ${snapshot.error}'),
            ),
          );
        } else {
          

          projectRepository.deleteAllProjects();

          return Scaffold(
            appBar: AppBar(
              title: const Text('Snag Application'),
            ),
          );
        }
      },
    );
  }
}