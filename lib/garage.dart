import 'package:flutter/material.dart';
import 'package:road_rescue_app/login.dart';
import 'package:road_rescue_app/main.dart';

class GaragePage extends StatelessWidget {
  const GaragePage({Key? key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Road Rescue'),
        backgroundColor: const Color(0xFF9BC1BC),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            // Handle menu button press
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
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
      backgroundColor: Color(0xFF9BC1BC).withOpacity(0.5),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.garage),
            label: 'Garage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Login',
          ),
        ],
        onTap: (int index) {
          // Handle navigation based on the index tapped
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(
                    title: 'Home Page',
                  ),
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GaragePage(
                    title: 'Garage Page',
                  ),
                ),
              );
              break;
            case 2:
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

class GarageDetailsPage extends StatelessWidget {
  const GarageDetailsPage({Key? key, required this.garage}) : super(key: key);

  final Garage garage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(garage.name),
        backgroundColor: const Color(0xFF9BC1BC),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 20), // Add this line
              if (garage != null) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('${garage.imageUrl}'),
                      radius: 30,
                    ),
                    const SizedBox(width: 10), // Add this line for the gap
                    Text(
                      '${garage.name}\nContact: ${garage.contactNumber}',
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
                    (garage.location),
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
                                  print('Booked');
                                },
                                child: Text(
                                  'Book',
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
                                  print('Booked');
                                },
                                child: Text(
                                  'Book',
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
                                  print('Booked');
                                },
                                child: Text(
                                  'Book',
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
                                  print('Booked');
                                },
                                child: Text(
                                  'Book',
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
                                  AssetImage('${garage.reviewimage1}'),
                              radius: 30,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  (garage.reviewname1),
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  (garage.review1),
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
                                  AssetImage('${garage.reviewimage2}'),
                              radius: 30,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  (garage.reviewname2),
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  (garage.review2),
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
                        width: 200,
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
                                  '${garage.image1}'), // Assuming garage.image2 is an asset path
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
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
                                  '${garage.image2}'), // Assuming garage.image2 is an asset path
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
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
                                  '${garage.image2}'), // Assuming garage.image2 is an asset path
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
    imageUrl: 'assets/images/login page image.jpeg',
    location:
        '3VJQ+PW2, OPP. SHIV MANDIR, R.B. MARG,\nVIDYAVIHAR ROAD, NAVPADA,Ambedkar Nagar,\nKurla West, Kurla, Mumbai, Maharashtra 400070',
    contactNumber: '08652803951',
    reviewname1: 'Dwayne Nixon',
    reviewimage1: 'assets/images/login page image.jpeg',
    review1: 'Great service, very professional and \nfriendly staff.',
    reviewname2: 'Rajesh Kumar',
    reviewimage2: 'assets/images/login page image.jpeg',
    review2: 'Excellent service, very professional and \nfriendly staff.',
    image1: 'assets/images/login page image.jpeg',
    image2: 'assets/images/login page image.jpeg',
  ),
  Garage(
      name: 'Garage 2',
      imageUrl: 'assets/images/login page image.jpeg',
      location: 'Location 2',
      contactNumber: 'Phone 2',
      reviewname1: '0',
      reviewimage1: 'assets/images/login page image.jpeg',
      review1: '0',
      reviewname2: '0',
      reviewimage2: 'assets/images/login page image.jpeg',
      review2: '0',
      image1: 'assets/images/login page image.jpeg',
      image2: 'assets/images/login page image.jpeg'),
];
