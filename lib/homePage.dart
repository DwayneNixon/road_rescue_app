import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:road_rescue_app/Service.dart';
import 'package:road_rescue_app/login.dart';
import 'package:road_rescue_app/map.dart';
import 'package:road_rescue_app/Emergencypage.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RR extends StatelessWidget {
  final color_white = Colors.white60;

  const RR({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Road Rescue',
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
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
                      viewportFraction: 1,
                    ),
                    items: [
                      Image.asset(
                        'assets/images/HomePage_icons/images (1).jpeg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/HomePage_icons/How-to-keep-your-car-safe-this-Diwali.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/HomePage_icons/blog_11.jpg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/HomePage_icons/3cd03974-13be-4ddd-81e8-d87a8e842b3b.jpeg',
                        fit: BoxFit.cover,
                      ),
                      Image.asset(
                        'assets/images/HomePage_icons/6701eec5-6388-4bdc-89c7-10b12fb64a8c.jpeg',
                        fit: BoxFit.cover,
                      ),
                      // Add more images here
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 9.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: color_white,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/HomePage_icons/notification.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Notifications',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Emergencypage()),
                              );
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/HomePage_icons/Emge.png',
                                    height: 24,
                                    width: 24,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'Emergency',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Services',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PicturePage(),
                                ),
                              );
                            },
                            child: Container(
                              height: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/HomePage_icons/Repair.png',
                                    height: 48,
                                    width: 48,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Repair',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: color_white,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to the desired page
                            },
                            child: Container(
                              height: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/HomePage_icons/Towing.png',
                                    height: 48,
                                    width: 48,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Towing',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: color_white,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to the desired page
                            },
                            child: Container(
                              height: 120,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/HomePage_icons/chat.png',
                                    height: 48,
                                    width: 48,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Blog',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: color_white,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Live Map Location',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MapPage()),
                            );
                          },
                          child: Container(
                            height: 300,
                            width: 400,
                            decoration: BoxDecoration(
                              color: color_white,
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: Image.asset(
                              'assets/images/HomePage_icons/360_F_554093090_372SlpLXbrLROL0VhPBVVOdeeAqU1gWO.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.garage),
            label: 'Service',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Blog',
          ),
        ],
        currentIndex: 0, // Set the default index to 1
        onTap: (int index) {
          // Handle navigation based on the index tapped
          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PicturePage(),
                ),
              );
              break;
            case 2:
              break;
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RR(),
                ),
              );
              break;
          }
        },
        backgroundColor: const Color(0xFF9BC1BC),
        selectedItemColor: Colors.white,
      ),
    );
  }
}
