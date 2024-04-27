import 'package:flutter/material.dart';

class UpdatesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Set the background color to blue
        title: Center(
          child: Text(
            'Updates',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          UpdateContainer(
            title: 'Version 1.2',
            description: 'Added Map Services',
          ),
          UpdateContainer(
            title: 'Version 1.1',
            description: 'Added Emergency Services',
          ),
          UpdateContainer(
            title: 'Version 1.0',
            description: 'Launch of Road Rescue',
          ),
        ],
      ),
    );
  }
}

class UpdateContainer extends StatelessWidget {
  final String title;
  final String description;

  const UpdateContainer({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(description),
        ],
      ),
    );
  }
}
