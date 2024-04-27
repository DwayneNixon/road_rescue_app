import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:road_rescue_app/Service.dart';
import 'package:road_rescue_app/chat.dart';
import 'package:road_rescue_app/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:road_rescue_app/homePage.dart';
import 'Providerspage.dart';

class TowingServicesPage extends StatelessWidget {
  _callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Towing Services',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RR(),
              ),
            );
          },
          icon: Icon(Icons.home),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Logout'),
                    content: Text('Are you sure you want to logout?'),
                    actions: [
                      TextButton(
                        child: Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Logout'),
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.perm_identity_sharp),
          )
        ],
        backgroundColor: const Color(0xFF9BC1BC),
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
                          DropdownMenuItem(
                              child: Text('Light Vehicle'), value: 'Light'),
                          DropdownMenuItem(
                              child: Text('Medium Vehicle'), value: 'Medium'),
                          DropdownMenuItem(
                              child: Text('Heavy Vehicle'), value: 'Heavy'),
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
                        MaterialPageRoute(
                            builder: (context) => ProvidersPage()),
                      ); // Handle form submission
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.green, // Set button color to green
                      padding: EdgeInsets.symmetric(
                          vertical: 15.0), // Set button height
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.black), // Set text color to black
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
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.call, color: Colors.white),
                          SizedBox(width: 8.0),
                          Text('Emergency Helpline',
                              style: TextStyle(color: Colors.white)),
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
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.garage),
            label: 'Repair',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fire_truck),
            label: 'Towing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Helper Bot',
          ),
        ],
        currentIndex: 1,
        onTap: (int index) {
          // Handle navigation based on the index tapped
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PicturePage(),
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TowingServicesPage(),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatBot(),
                ),
              );
              break;
          }
        },
        backgroundColor: const Color(0xFF9BC1BC),
        selectedItemColor: Colors.white,
        unselectedItemColor:
            Colors.black, // Add this line to set the unselected item color
      ),
    );
  }
}
