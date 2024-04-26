import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class ProvidersPage extends StatelessWidget {
  _callNumber(String number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Towing Service Providers'),
      ),
      backgroundColor: Color(0xFF003566),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Towing Provider Container 1
            _buildTowingProviderContainer(
              context,
              'Swift Towing Co.',
              '123-456-7890',
              'swifttow@gmail.com',
              '4.9',
              '11', // Phone number for calling
            ),
            SizedBox(height: 20.0),
            // Towing Provider Container 2
            _buildTowingProviderContainer(
              context,
              'Superior Towline Services',
              '987-654-3210',
              'superiortow@gmail.com',
              '4.5',
              '22', // Phone number for calling
            ),
            SizedBox(height: 20.0),
            // Towing Provider Container 3
            _buildTowingProviderContainer(
              context,
              'Guardian Towing',
              '567-890-1234',
              'guardian007@gmail.com',
              '3.8',
              '33', // Phone number for calling
            ),
            SizedBox(height: 20.0),
            // Towing Provider Container 4
            _buildTowingProviderContainer(
              context,
              'Star Tow Truck Service',
              '567-890-1234',
              'startow52@gmail.com',
              '2.5',
              '44', // Phone number for calling
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTowingProviderContainer(BuildContext context, String name, String phone, String email, String rating, String phoneNumber) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Color(0xFFF6f4d2),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.0),
          Row(
            children: [
              Icon(Icons.phone),
              SizedBox(width: 8.0),
              Text(
                phone,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.email),
              SizedBox(width: 8.0),
              Text(
                email,
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star),
              SizedBox(width: 8.0),
              Text(
                'Rating: $rating',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          InkWell(
            onTap: () => _callNumber(phoneNumber), // Call the provided phone number
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.green, // Set button color to green
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.call, color: Colors.black), // Set icon color to black
                  SizedBox(width: 8.0),
                  Text('Call', style: TextStyle(color: Colors.black)), // Set text color to black
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
