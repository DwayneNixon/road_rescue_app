import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'Providerspage.dart';

class TowingServicesPage extends StatelessWidget {
  _callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Towing Services'),
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Container(
              color: Color(0xFF4a4e69), // Set background color to #4a4e69
              child: Image.asset(
                'assets/images/TOWING.jpg',
                fit: BoxFit.fill,
                color: Colors.black.withOpacity(0.5),
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20.0), // Add space at the top
                Text(
                  'Request Towing Assistance',
                  style: TextStyle(
                    fontSize: 27.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                // Select Your Location Container
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Your Location',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your location',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.0),
                // Type of Assistance Container
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Type of Assistance',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      // Vehicle Type Dropdown
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'Select vehicle type',
                          border: OutlineInputBorder(),
                        ),
                        items: [
                          DropdownMenuItem(child: Text('Light Vehicle'), value: 'Light'),
                          DropdownMenuItem(child: Text('Medium Vehicle'), value: 'Medium'),
                          DropdownMenuItem(child: Text('Heavy Vehicle'), value: 'Heavy'),
                        ],
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40.0),
                // Additional Details Container
                Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Additional Details',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextFormField(
                        maxLines: 3,
                        decoration: InputDecoration(
                          hintText: 'Enter additional details',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 45.0),
                // Submit Button
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProvidersPage()),
                      ); // Handle form submission
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Set button color to green
                      padding: EdgeInsets.symmetric(vertical: 15.0), // Set button height
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.black), // Set text color to black
                    ),
                  ),
                ),
                SizedBox(height: 20.0), // Add space below the Submit button
                // Emergency Helpline Button
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: InkWell(
                    onTap: () => _callNumber('010'),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call, color: Colors.white),
                          SizedBox(width: 8.0),
                          Text('Emergency Helpline', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
