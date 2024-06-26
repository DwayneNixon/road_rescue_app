import 'package:flutter/material.dart';
import 'package:road_rescue_app/garage.dart';
import 'package:road_rescue_app/login.dart';
import 'package:road_rescue_app/homePage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:road_rescue_app/widgets/Towingpage.dart';
import 'package:road_rescue_app/chat.dart';

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
        title: Center(
          child: Text(
            'Repair Services',
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
        backgroundColor: const Color(0xFF5fa8d3),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              height: 200,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 250,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 2000),
                  viewportFraction: 0.95,
                ),
                items: [
                  Image.asset(
                    'assets/images/Services/75088069-car-repair-service-people-in-uniform-repair-the-broken-car.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/Services/147212196-car-service-concept-people-repair-car-using-professional-tool.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/Services/maruti-garage-chikhli-navsari-car-repair-and-services-mitsubishi-l6q83tz2t8.avif',
                    fit: BoxFit.cover,
                  ),
                  // Add more images here
                ],
              ),
            ),
            SizedBox(height: 20),
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
                    child: Column(
                      children: [
                        Container(
                          width: 100, // Reduce the width
                          height: 135, // Reduce the height
                          margin: EdgeInsets.only(
                              left: 16,
                              right: 15), // Add left and right margin for gap
                          decoration: BoxDecoration(
                            color: selectedVehicleIndex == 0
                                ? Color(0xFFc8b6ff) // Highlighted color
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black, // Add border color
                              width: 1, // Add border width
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/Services/electric-car.png', // Replace with your vehicle image path
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Gas Vehicle', // Replace with the text for the image
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectVehicle(1),
                    child: Column(
                      children: [
                        Container(
                          width: 100, // Reduce the width
                          height: 135, // Reduce the height
                          margin: EdgeInsets.only(
                              right: 15), // Add right margin for gap
                          decoration: BoxDecoration(
                            color: selectedVehicleIndex == 1
                                ? Color(0xFFc8b6ff) // Highlighted color
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black, // Add border color
                              width: 1, // Add border width
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/Services/motorbike.png', // Replace with your vehicle image path
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Motorbike', // Replace with the text for the image
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectVehicle(2),
                    child: Column(
                      children: [
                        Container(
                          width: 100, // Reduce the width
                          height: 135, // Reduce the height
                          margin: EdgeInsets.only(
                              right: 15), // Add right margin for gap
                          decoration: BoxDecoration(
                            color: selectedVehicleIndex == 2
                                ? Color(0xFFc8b6ff) // Highlighted color
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black, // Add border color
                              width: 1, // Add border width
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/Services/truck.png', // Replace with your vehicle image path
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Truck', // Replace with the text for the image
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectVehicle(3),
                    child: Column(
                      children: [
                        Container(
                          width: 100, // Reduce the width
                          height: 135, // Reduce the height
                          margin: EdgeInsets.only(
                              right: 15), // Add right margin for gap
                          decoration: BoxDecoration(
                            color: selectedVehicleIndex == 3
                                ? Color(0xFFc8b6ff) // Highlighted color
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black, // Add border color
                              width: 1, // Add border width
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/Services/battery.png', // Replace with your vehicle image path
                                fit: BoxFit.contain,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Electric Car', // Replace with the text for the image
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
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
                      width: 100, // Reduce the width
                      height: 40,
                      margin: EdgeInsets.only(
                          left: 16,
                          right: 15), // Add left and right margin for gap
                      decoration: BoxDecoration(
                        color: selectedModeIndex == 0
                            ? Color(0xFFc8b6ff) // Highlighted color
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black, // Add border color
                          width: 1, // Add border width
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Electric',
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
                      width: 100, // Reduce the width
                      height: 40,
                      margin: EdgeInsets.only(
                          right: 15), // Add right margin for gap
                      decoration: BoxDecoration(
                        color: selectedModeIndex == 1
                            ? Color(0xFFc8b6ff) // Highlighted color
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black, // Add border color
                          width: 1, // Add border width
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'CNG',
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
                      width: 100, // Reduce the width
                      height: 40,
                      margin: EdgeInsets.only(
                          right: 15), // Add right margin for gap
                      decoration: BoxDecoration(
                        color: selectedModeIndex == 2
                            ? Color(0xFFc8b6ff) // Highlighted color
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black, // Add border color
                          width: 1, // Add border width
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Petrol',
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
                      width: 100, // Reduce the width
                      height: 40,
                      margin: EdgeInsets.only(
                          right: 15), // Add right margin for gap
                      decoration: BoxDecoration(
                        color: selectedModeIndex == 3
                            ? Color(0xFFc8b6ff) // Highlighted color
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black, // Add border color
                          width: 1, // Add border width
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Diesel',
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
                      width: 100, // Reduce the width
                      height: 40,
                      margin: EdgeInsets.only(
                          right: 15), // Add right margin for gap
                      decoration: BoxDecoration(
                        color: selectedModeIndex == 4
                            ? Color(0xFFc8b6ff) // Highlighted color
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black, // Add border color
                          width: 1, // Add border width
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Power',
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
            SizedBox(height: 20),
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
                      width: 100, // Reduce the width
                      height: 135, // Reduce the height
                      margin: EdgeInsets.only(
                          left: 16,
                          right: 15), // Add left and right margin for gap
                      decoration: BoxDecoration(
                        color: selectedCategoryIndex == 0
                            ? Color(0xFFc8b6ff) // Highlighted color
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black, // Add border color
                          width: 1, // Add border width
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Services/car (1).png', // Replace with your vehicle image path
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Sports', // Replace with your category text
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectCategory(1),
                    child: Container(
                      width: 100, // Reduce the width
                      height: 135, // Reduce the height
                      margin: EdgeInsets.only(
                          right: 15), // Add right margin for gap
                      decoration: BoxDecoration(
                        color: selectedCategoryIndex == 1
                            ? Color(0xFFc8b6ff) // Highlighted color
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black, // Add border color
                          width: 1, // Add border width
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Services/sedan-car-model.png', // Replace with your vehicle image path
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Sedan', // Replace with your category text
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectCategory(2),
                    child: Container(
                      width: 100, // Reduce the width
                      height: 135, // Reduce the height
                      margin: EdgeInsets.only(
                          right: 15), // Add right margin for gap
                      decoration: BoxDecoration(
                        color: selectedCategoryIndex == 2
                            ? Color(0xFFc8b6ff) // Highlighted color
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black, // Add border color
                          width: 1, // Add border width
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Services/car-of-hatchback-model.png', // Replace with your vehicle image path
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Hatchback', // Replace with your category text
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => selectCategory(3),
                    child: Container(
                      width: 100, // Reduce the width
                      height: 135, // Reduce the height
                      margin: EdgeInsets.only(
                          right: 15), // Add right margin for gap
                      decoration: BoxDecoration(
                        color: selectedCategoryIndex == 3
                            ? Color(0xFFc8b6ff) // Highlighted color
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.black, // Add border color
                          width: 1, // Add border width
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/Services/car.png', // Replace with your vehicle image path
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'SUV', // Replace with your category text
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
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
                backgroundColor: Colors.green, // Set text color
                padding: EdgeInsets.symmetric(
                    horizontal: 160, vertical: 15), // Increase vertical padding
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(20), // Set button border radius
                ),
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text('Next'),
            ),
            SizedBox(height: 10),
          ],
        ),
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
        currentIndex: 0,
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
        backgroundColor: const Color(0xFF5fa8d3),
        selectedItemColor: Colors.white,
        unselectedItemColor:
            Colors.black, // Add this line to set the unselected item color
      ),
      backgroundColor: Color(0xFFf8edeb),
    );
  }
}
