import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snag_application_1/models/project.dart';
import 'package:snag_application_1/ui/screens/project_view_screen.dart';
import 'package:snag_application_1/ui/utils/form.dart';

class ProjectCreateFormScreen extends StatefulWidget {
  const ProjectCreateFormScreen({super.key});

  @override
  _ProjectCreateFormScreenState createState() => _ProjectCreateFormScreenState();
}

class _ProjectCreateFormScreenState extends State<ProjectCreateFormScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  final TextEditingController _projetRefController = TextEditingController();
  final TextEditingController _clientController = TextEditingController();
  XFile? _selectedImage;

  void _createProject () async {
    final String name = _nameController.text;
    final String description = _descriptionController.text;
    final String location = _locationController.text;
    final String projectRef = _projetRefController.text;
    final String client = _clientController.text;

    final project = Project(
      name: name,
      description: description,
      location: location,
      logoImage: _selectedImage,
      projectRef: projectRef,
      client: client,
      lastModified: DateTime.now(),
    );
    final box = await Hive.openBox<Project>('projects');
    await box.add(project);

    if (mounted) {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProjectViewScreen(project: project),
        ),
      );
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: source);
    setState(() {
      _selectedImage = image;
    });
  }

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              )
            ]
          )
        );
      },
    );
  }

  Widget buildImageInput(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Roboto',
          ),
        ),
        const SizedBox(height: 12.0),
        GestureDetector(
          onTap: () => _showImageSourceActionSheet(context),
          child: Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF333333)),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: _selectedImage == null 
            ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(
                      Icons.upload, color: Color(0xFF333333), size: 40,
                    ),
                    Text(
                      'Upload Image',
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Roboto',
                      ),
                    ),
                ],
              )
            )
            : Image.file(
              File(_selectedImage!.path),
              fit: BoxFit.cover,
            )
          )
        )
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Project'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.popUntil(context, (route) => route.isFirst); // Navigate back to the first route
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTextInput('Project title', 'Ex. My new project', _nameController),
              const SizedBox(height: 28.0),
              buildImageInput('Project logo'),
              const SizedBox(height: 28.0),
              buildLongTextInput('Description', 'Ex. Short description of project', _descriptionController),
              const SizedBox(height: 28.0),
              buildTextInput('Location', 'Ex. Greenford Station, UB6 8PX', _locationController),
              const SizedBox(height: 28.0),
              buildTextInput('Project reference', 'Ex. project reference', _projetRefController),
              const SizedBox(height: 28.0),
              buildTextInput('Client', 'Ex. London Underground', _clientController),
              const SizedBox(height: 28.0),

              ElevatedButton(
                onPressed: _createProject,
                child: const Text('Create project'),
              )
            ],
          )
        )
      )
    );
  }
}