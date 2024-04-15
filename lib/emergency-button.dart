import 'package:flutter/material.dart';
import 'package:road_rescue_app/Emergencypage.dart';

class EmergencyButton extends StatelessWidget {
  const EmergencyButton({
    Key? key,
    required this.buttonName,
    required this.onPressed,
  }) : super(key: key);

  final String buttonName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.red, // Red background color for emergency button
      ),
      child: TextButton(
        onPressed: () {
          // Navigate to the emergency page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Emergencypage()),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_alert,
              color: Colors.white, // White color for alert icon
            ),
            SizedBox(width: 8), // Add some space between the icon and text
            Text(
              buttonName,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
