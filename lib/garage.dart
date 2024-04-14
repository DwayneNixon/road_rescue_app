import 'package:flutter/material.dart';
import 'package:road_rescue_app/Service.dart';
import 'package:road_rescue_app/homePage.dart';
import 'package:road_rescue_app/login.dart';
import 'package:road_rescue_app/main.dart';

class GaragePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Garages'),
        backgroundColor: const Color(0xFF9BC1BC),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: garageList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Handle column click event
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GarageDetailsPage(
                          garage: garageList[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    color: const Color(0xFF9BC1BC),
                    child: SizedBox(
                      height: 100, // Increase the height as desired
                      child: Center(
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('${garageList[index].imageUrl}'),
                                radius: 30,
                              ),
                              const SizedBox(
                                  width: 10), // Add this line for the gap
                              Text(
                                garageList[index].name,
                                style: const TextStyle(
                                  fontSize:
                                      30, // Increase the font size as desired
                                  fontWeight:
                                      FontWeight.bold, // Make the text bold
                                ),
                                textAlign: TextAlign
                                    .center, // Align the text to the middle of the right side
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
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
                  builder: (context) => PicturePage(),
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

class GarageDetailsPage extends StatefulWidget {
  const GarageDetailsPage({Key? key, required this.garage}) : super(key: key);

  final Garage garage;

  @override
  State<GarageDetailsPage> createState() => _GarageDetailsPageState();
}

class _GarageDetailsPageState extends State<GarageDetailsPage> {
  String Booked = 'Book';
  String Booked1 = 'Book';
  String Booked2 = 'Book';
  String Booked3 = 'Book';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.garage.name),
        backgroundColor: const Color(0xFF9BC1BC),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20), // Add this line
              if (widget.garage != null) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('${widget.garage.imageUrl}'),
                      radius: 30,
                    ),
                    const SizedBox(width: 10), // Add this line for the gap
                    Text(
                      '${widget.garage.name}\nContact: ${widget.garage.contactNumber}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Address',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 420,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    (widget.garage.location),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Book Tickets',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 170,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 100,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            print('Booked');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 10),
                              CircleAvatar(
                                child: Icon(
                                  Icons.oil_barrel_rounded,
                                  size: 30,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Fuel',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              TextButton(
                                onPressed: () {
                                  // print('Booked');
                                  setState(() {
                                    if (Booked == 'Book') {
                                      Booked = 'Booked';
                                    } else {
                                      Booked = 'Book';
                                    }
                                  });
                                },
                                child: Text(
                                  Booked,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            print('Booked');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 10),
                              CircleAvatar(
                                child: Icon(
                                  Icons.sports_soccer,
                                  size: 30,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Puncture',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              TextButton(
                                onPressed: () {
                                  // print('Booked');
                                  setState(() {
                                    if (Booked1 == 'Book') {
                                      Booked1 = 'Booked';
                                    } else {
                                      Booked1 = 'Book';
                                    }
                                  });
                                },
                                child: Text(
                                  Booked1,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 120,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            print('Booked');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 10),
                              CircleAvatar(
                                child: Icon(
                                  Icons.miscellaneous_services_outlined,
                                  size: 30,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Maintenance',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              TextButton(
                                onPressed: () {
                                  // print('Booked');
                                  setState(() {
                                    if (Booked2 == 'Book') {
                                      Booked2 = 'Booked';
                                    } else {
                                      Booked2 = 'Book';
                                    }
                                  });
                                },
                                child: Text(
                                  Booked2,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 100,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            print('Booked');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 10),
                              CircleAvatar(
                                child: Icon(
                                  Icons.emergency_outlined,
                                  size: 30,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Shutdown',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 10),
                              TextButton(
                                onPressed: () {
                                  // print('Booked');
                                  setState(() {
                                    if (Booked3 == 'Book') {
                                      Booked3 = 'Booked';
                                    } else {
                                      Booked3 = 'Book';
                                    }
                                  });
                                },
                                child: Text(
                                  Booked3,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Add more items here
                    ],
                  ),
                ),
                const Text(
                  'Reviews',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 400,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10),
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('${widget.garage.reviewimage1}'),
                              radius: 30,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  (widget.garage.reviewname1),
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  (widget.garage.review1),
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 400,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 10),
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('${widget.garage.reviewimage2}'),
                              radius: 30,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  (widget.garage.reviewname2),
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  (widget.garage.review2),
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Add more items here
                    ],
                  ),
                ),
                const Text(
                  'Site Images',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 300,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  '${widget.garage.image1}'), // Assuming garage.image2 is an asset path
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  '${widget.garage.image2}'), // Assuming garage.image2 is an asset path
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ), // Add more items he// Add more items here
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class Garage {
  final String name;
  final String imageUrl;
  final String location;
  final String contactNumber;
  final String reviewname1;
  final String reviewimage1;
  final String review1;
  final String reviewname2;
  final String reviewimage2;
  final String review2;
  final String image1;
  final String image2;

  Garage({
    required this.name,
    required this.imageUrl,
    required this.location,
    required this.contactNumber,
    required this.reviewname1,
    required this.reviewimage1,
    required this.review1,
    required this.reviewname2,
    required this.reviewimage2,
    required this.review2,
    required this.image1,
    required this.image2,
  });
}

List<Garage> garageList = [
  Garage(
    name: 'Raza Motor Garage',
    imageUrl: 'assets/images/Garage 1/thumbnail.jpeg',
    location:
        '3VJQ+PW2, OPP. SHIV MANDIR, R.B. MARG,\nVIDYAVIHAR ROAD, NAVPADA,Ambedkar Nagar,\nKurla West, Kurla, Mumbai, Maharashtra 400070',
    contactNumber: '08652803951',
    reviewname1: 'Dwayne Nixon',
    reviewimage1: 'assets/images/download.jpeg',
    review1: 'Great service, very professional and \nfriendly staff.',
    reviewname2: 'Rajesh Kumar',
    reviewimage2: 'assets/images/download.jpeg',
    review2: 'Excellent service, very professional and \nfriendly staff.',
    image1: 'assets/images/Garage 1/2016-01-21.jpg',
    image2: 'assets/images/Garage 1/2024-03-18.jpg',
  ),
  Garage(
      name: 'Alfa Motor Garage',
      imageUrl: 'assets/images/Garage 2/unnamed.jpg',
      location:
          'Premier Gate No.6, Milind Nagar, Vidyavihar Rd, \nnear S.T. Workshop, Kurla West, Mumbai, \nMaharashtra 400070',
      contactNumber: '09594414196',
      reviewname1: 'Shreya Chakraborty',
      reviewimage1: 'assets/images/download.jpeg',
      review1: 'Good Service and \nFriendly Staff',
      reviewname2: 'Ravi Singh',
      reviewimage2: 'assets/images/download.jpeg',
      review2: 'Terrible Service and \nUnfriendly Staff',
      image1: 'assets/images/Garage 2/unnamed (1).jpg',
      image2: 'assets/images/Garage 2/thumbnail.jpeg'),
  Garage(
      name: 'GoMechanic',
      imageUrl: 'assets/images/Garage 3/2024-03-21.jpg',
      location:
          'Shop No 1, Gurunanak Nagar, Narayan Nagar, \nGhatkopar West, Mumbai, Maharashtra 400072',
      contactNumber: '08398970970',
      reviewname1: 'David James',
      reviewimage1: 'assets/images/download.jpeg',
      review1: 'Remote Location and \nPoor Service',
      reviewname2: 'Jayesh Patel',
      reviewimage2: 'assets/images/download.jpeg',
      review2: 'Sraff were alright but \nService was poor',
      image1: 'assets/images/Garage 3/2023-03-16.jpg',
      image2: 'assets/images/Garage 3/2023-01-07.jpg'),
  Garage(
      name: 'Bombay Garage',
      imageUrl: 'assets/images/Garage 4/thumbnail.jpeg',
      location:
          'Lok Tilak Terminus A/C Waiting Hall, \nLokmanya Tilak Terminus Railway Yard, \nKurla, Mumbai, Maharashtra 400089',
      contactNumber: '98756432102',
      reviewname1: 'Shaun Menezes',
      reviewimage1: 'assets/images/download.jpeg',
      review1: 'Terrible Place, had to wait for hours \nfor service',
      reviewname2: 'Swayam Singh',
      reviewimage2: 'assets/images/download.jpeg',
      review2: 'Never Coming Here again.',
      image1: 'assets/images/Garage 4/thumbnail2.jpeg',
      image2: 'assets/images/Garage 4/2022-07-11.jpg'),
];
