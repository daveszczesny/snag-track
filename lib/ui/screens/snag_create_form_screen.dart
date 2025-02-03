import 'package:flutter/material.dart';
import 'package:snag_application_1/models/project.dart';
import 'package:snag_application_1/models/snag.dart';
import 'package:snag_application_1/models/status.dart';
import 'package:snag_application_1/ui/utils/form.dart';

class SnagCreateFormScreen extends StatefulWidget {
  final Project? project;
  final VoidCallback? onSnagCreated;

  const SnagCreateFormScreen({super.key, this.project, this.onSnagCreated});

  @override
  _SnagCreateFormScreenState createState() => _SnagCreateFormScreenState();
}

class _SnagCreateFormScreenState extends State<SnagCreateFormScreen> {
  final TextEditingController _nameController = TextEditingController();

  void _createSnag() async {
    final String name = _nameController.text;

    if (widget.project != null) { // project has been provided
        final snag = Snag(
          name: name,
          status: Status.todo,
        );

        widget.project!.snags.add(snag);
        await widget.project!.save();

        if(widget.onSnagCreated != null){
          widget.onSnagCreated!();
        }

    } else {
      // need to ask the user which project to add the snag to
    }

  }


  @override
  Widget build(BuildContext context) {
    if (widget.project == null) { // when using quick add
      return Scaffold(
        appBar: AppBar(
          title: const Text('Create Snag'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.popUntil(context, (route) => route.isFirst);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(38.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextInput('Snag name', 'Ex. Broken light', _nameController),
                const SizedBox(height: 28.0),
                ElevatedButton(
                  onPressed: _createSnag,
                  child: const Text('Create snag'),
                )
              ],
            )
          )
        )
      );
    } else { // if we are adding to a project
      return Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(38.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildTextInput('Snag name', 'Ex. Broken light', _nameController),
                const SizedBox(height: 28.0),
                ElevatedButton(
                  onPressed: _createSnag,
                  child: const Text('Create snag'),
                )
              ],
            )
          )
        )
      );
    }
    
  }
  
}