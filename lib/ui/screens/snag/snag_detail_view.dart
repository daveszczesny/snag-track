import 'package:flutter/material.dart';
import 'package:snag_application_1/models/snag.dart';

class SnagDetailView extends StatefulWidget {
  final Snag snag;

  const SnagDetailView({
    super.key,
    required this.snag,
  });

  @override
  _SnagDetailViewState createState() => _SnagDetailViewState();
}

class _SnagDetailViewState extends State<SnagDetailView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.snag.name)
      ),
      body: Padding(
        padding: const EdgeInsets.all(38.0),
        child: Center (
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'viewing ${widget.snag.name}',
                style: const TextStyle(fontSize: 16),
              ),
              // Add more snag details here
            ],
          ),
        )
      )
    );
  }
}