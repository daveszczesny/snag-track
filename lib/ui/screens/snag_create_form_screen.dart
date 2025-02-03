import 'package:flutter/material.dart';

class SnagCreateFormScreen extends StatelessWidget {
  const SnagCreateFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Snag'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Snag Name',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8.0),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter snag name',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Snag Description',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8.0),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter snag description',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle snag creation logic here
              },
              child: const Text('Create Snag'),
            ),
          ],
        ),
      ),
    );
  }
}