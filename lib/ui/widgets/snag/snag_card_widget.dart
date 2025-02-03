import 'dart:io';

import 'package:flutter/material.dart';
import 'package:snag_application_1/models/project.dart';
import 'package:snag_application_1/models/snag.dart';
import 'package:snag_application_1/ui/screens/project_view_screen.dart';
import 'package:snag_application_1/ui/screens/test_screen.dart';

class SnagCardWidget extends StatefulWidget {
  final Snag snag;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  const SnagCardWidget({
    super.key,
    required this.snag,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  _SnagCardWidget createState() => _SnagCardWidget();
}

class _SnagCardWidget extends State<SnagCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TestScreen()),
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
                child: widget.snag.images?[0] != null
                  ? Image.file(
                    File(widget.snag.images![0].path),
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                  : const Icon(Icons.image, color: Colors.white),
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
                      value: 'View snag',
                      child: const Text('View snag'),
                    ),
                    PopupMenuItem<String>(
                      value: 'Share snag',
                      child: const Text('Share snag'),
                    ),
                    PopupMenuItem<String>(
                      value: 'Edit snag',
                      child: const Text('Edit snag'),
                    ),
                    const PopupMenuDivider(
                      height: 1.0,
                    ),
                    PopupMenuItem<String>(
                      value: 'Delete snag',
                      child: Text('Delete snag', style: TextStyle(color: Colors.red)),
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