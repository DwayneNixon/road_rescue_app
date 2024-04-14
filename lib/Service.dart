import 'package:flutter/material.dart';
import 'package:road_rescue_app/garage.dart';
import 'package:road_rescue_app/login.dart';
import 'package:road_rescue_app/homePage.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PicturePage extends StatefulWidget {
  @override
  _PicturePageState createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  int selectedVehicleIndex = -1;
  int selectedModeIndex = -1;
  int selectedCategoryIndex = -1;

  void selectVehicle(int index) {
    setState(() {
      selectedVehicleIndex = index;
    });
  }

  void selectMode(int index) {
    setState(() {
      selectedModeIndex = index;
    });
  }

  void selectCategory(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Picture Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  viewportFraction: 0.8,
                ),
                items: [
                  Image.asset(
                    'assets/images/Garage 3/2023-01-07.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/Garage 3/2023-01-07.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/Garage 3/2023-01-07.jpg',
                    fit: BoxFit.cover,
                  ),
                  // Add more images here
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 16), // Add left padding
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Vehicle Type',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => selectVehicle(0),
                    child: Container(
                      width: 120,
                      height: 100,
                      margin: EdgeInsets.only(
                          left: 16,
                          right: 10), // Add left and right margin for gap
                      decoration: BoxDecoration(
                        color: selectedVehicleIndex == 0
                            ? Colors.green // Highlighted color
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/login page image.jpeg', // Replace with your vehicle image path
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectVehicle(1),
                    child: Container(
                      width: 120,
                      height: 100,
                      margin: EdgeInsets.only(
                          right: 10), // Add right margin for gap
                      decoration: BoxDecoration(
                        color: selectedVehicleIndex == 1
                            ? Colors.green // Highlighted color
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/login page image.jpeg', // Replace with your vehicle image path
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectVehicle(2),
                    child: Container(
                      width: 120,
                      height: 100,
                      margin: EdgeInsets.only(
                          right: 10), // Add right margin for gap
                      decoration: BoxDecoration(
                        color: selectedVehicleIndex == 2
                            ? Colors.green // Highlighted color
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/login page image.jpeg', // Replace with your vehicle image path
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectVehicle(3),
                    child: Container(
                      width: 120,
                      height: 100,
                      margin: EdgeInsets.only(
                          right: 10), // Add right margin for gap
                      decoration: BoxDecoration(
                        color: selectedVehicleIndex == 3
                            ? Colors.green // Highlighted color
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/login page image.jpeg', // Replace with your vehicle image path
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 16), // Add left padding
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Vehicle Mode',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => selectMode(0),
                    child: Container(
                      width: 200,
                      height: 40,
                      margin: EdgeInsets.only(
                          left: 16,
                          right: 10), // Add left and right margin for gap
                      decoration: BoxDecoration(
                        color: selectedModeIndex == 0
                            ? Colors.green // Highlighted color
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Vehicle 1',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectMode(1),
                    child: Container(
                      width: 200,
                      height: 40,
                      margin: EdgeInsets.only(
                          right: 10), // Add right margin for gap
                      decoration: BoxDecoration(
                        color: selectedModeIndex == 1
                            ? Colors.green // Highlighted color
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Vehicle 2',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectMode(2),
                    child: Container(
                      width: 200,
                      height: 40,
                      margin: EdgeInsets.only(
                          right: 10), // Add right margin for gap
                      decoration: BoxDecoration(
                        color: selectedModeIndex == 2
                            ? Colors.green // Highlighted color
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Vehicle 3',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectMode(3),
                    child: Container(
                      width: 200,
                      height: 40,
                      margin: EdgeInsets.only(
                          right: 10), // Add right margin for gap
                      decoration: BoxDecoration(
                        color: selectedModeIndex == 3
                            ? Colors.green // Highlighted color
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Vehicle 4',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectMode(4),
                    child: Container(
                      width: 200,
                      height: 40,
                      margin: EdgeInsets.only(
                          right: 10), // Add right margin for gap
                      decoration: BoxDecoration(
                        color: selectedModeIndex == 4
                            ? Colors.green // Highlighted color
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Vehicle 5',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 16), // Add left padding
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Vehicle Category',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => selectCategory(0),
                    child: Container(
                      width: 120,
                      height: 100,
                      margin: EdgeInsets.only(
                          left: 16,
                          right: 10), // Add left and right margin for gap
                      decoration: BoxDecoration(
                        color: selectedCategoryIndex == 0
                            ? Colors.green // Highlighted color
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/login page image.jpeg', // Replace with your vehicle image path
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectCategory(1),
                    child: Container(
                      width: 120,
                      height: 100,
                      margin: EdgeInsets.only(
                          right: 10), // Add right margin for gap
                      decoration: BoxDecoration(
                        color: selectedCategoryIndex == 1
                            ? Colors.green // Highlighted color
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/login page image.jpeg', // Replace with your vehicle image path
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectCategory(2),
                    child: Container(
                      width: 120,
                      height: 100,
                      margin: EdgeInsets.only(
                          right: 10), // Add right margin for gap
                      decoration: BoxDecoration(
                        color: selectedCategoryIndex == 2
                            ? Colors.green // Highlighted color
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/login page image.jpeg', // Replace with your vehicle image path
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectCategory(3),
                    child: Container(
                      width: 120,
                      height: 100,
                      margin: EdgeInsets.only(
                          right: 10), // Add right margin for gap
                      decoration: BoxDecoration(
                        color: selectedCategoryIndex == 3
                            ? Colors.green // Highlighted color
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        'assets/images/login page image.jpeg', // Replace with your vehicle image path
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                if (selectedVehicleIndex != null &&
                    selectedModeIndex != null &&
                    selectedCategoryIndex != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GaragePage()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Set text color
                padding: EdgeInsets.symmetric(
                    horizontal: 20, vertical: 15), // Increase vertical padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10), // Set button border radius
                ),
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text('Next'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Login',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.garage),
            label: 'Service',
          ),
        ],
        onTap: (int index) {
          // Handle navigation based on the index tapped
          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RR(),
                ),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GaragePage(),
                ),
              );
              break;
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              );
              break;
          }
        },
        backgroundColor: const Color(0xFF9BC1BC),
      ),
    );
  }
}
