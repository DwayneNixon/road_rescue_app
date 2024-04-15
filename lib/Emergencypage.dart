import 'package:flutter/material.dart';
import 'package:road_rescue_app/widgets/emergencywidgets/emergency.dart';

class Emergencypage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emergency Page'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 200, // Adjust height as needed
            decoration: BoxDecoration(
              color: Colors.blue, // Choose your desired color
            ),
            child: Image.asset(
              'assets/images/emergencypage.png', // Replace with your image asset path
              fit: BoxFit.cover, // Adjust the image fit as needed
            ),
          ),
          SizedBox(height: 20), // Add some space between the image and text
          Center(
            child: Text(
              'Emergency',
              style: TextStyle(fontSize: 24),
            ),
          ),
          Emergency(),
        ],
      ),
    );
  }
}
