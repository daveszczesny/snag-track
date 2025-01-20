import 'package:flutter/material.dart';
import 'package:snag_application_1/models/priority_enum.dart';
import 'package:snag_application_1/models/project.dart';
import 'package:snag_application_1/models/snag.dart';
import 'package:snag_application_1/repositories/project/local_project_repository.dart';
import 'package:snag_application_1/repositories/snag/local_snag_repository.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Project project = Project();
    project.setLocalizedName(context);

    project.client='Client';
    project.contractor='Contractor';
    project.location = "London";

    for (int i = 0; i < 5; i++) {
      Snag snag = Snag();
      snag.name = 'Snag $i';
      snag.priority = Priority.low;
      project.snags.add(snag);
    }


    List<Snag> snags = snagRepository.getSnags();

    projectRepository.addProject(project);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Snag Application'),
      ),
      body: ListView.builder(
        itemCount: snags.length,
        itemBuilder: (context, index) {
          Snag snag = snags[index];
          snag.setLocalizedName(context);
          return ListTile(
            title: Text(snag.name),
          );
        },
      ),
    );
  }
}