import 'package:flutter/material.dart';
import 'package:road_rescue_app/widgets/emergencywidgets/emergency.dart';
import 'package:road_rescue_app/widgets/emergencywidgets/servicesemergency.dart';

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
          SizedBox(height: 30), // Add some space between the image and text
          Center(
            child: Text(
              'Emergency Hotline',
              style: TextStyle(
                fontSize: 24,
                color: Colors.red, // Set font color to red
                fontWeight: FontWeight.bold, // Make the text bold
              ),
            ),
          ),
          Emergency(),
          SizedBox(height: 30), // Add some space between the "Emergency" section and "Emergency Services" section
          Center(
            child: Text(
              'Emergency Roadside Assistance',
              style: TextStyle(
                fontSize: 24,
                color: Colors.red, // Set font color to red
                fontWeight: FontWeight.bold, // Make the text bold
              ),
            ),
          ),
          ServicesEmergency(),
          // Add your containers for emergency services here
        ],
      ),
    );
  }
}
