import 'package:flutter/material.dart';

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
        child: ListView.builder(
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
                      title: Text(
                        garageList[index].name,
                        style: const TextStyle(
                          fontSize: 30, // Increase the font size as desired
                          fontWeight: FontWeight.bold, // Make the text bold
                        ),
                        textAlign: TextAlign
                            .center, // Align the text to the middle of the right side
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
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
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20), // Add this line
            if (garage != null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(garage.imageUrl ?? ''),
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
                height: 150,
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
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage('IMAGE_URL'),
                            radius: 30,
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Fuel',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 120,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage('IMAGE_URL'),
                            radius: 30,
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Maintenance',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage('IMAGE_URL'),
                            radius: 30,
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Puncture',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage('IMAGE_URL'),
                            radius: 30,
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Shutdown',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
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
                          const CircleAvatar(
                            backgroundImage: NetworkImage('IMAGE_URL'),
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
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          CircleAvatar(
                            backgroundImage: NetworkImage('IMAGE_URL'),
                            radius: 30,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Name',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                'Review',
                                style: TextStyle(
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
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('IMAGE_URL'),
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
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('IMAGE_URL'),
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
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('IMAGE_URL'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ), // Add more items here
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class Garage {
  final String name;
  final String location;
  final String contactNumber;
  final String reviewname1;
  final String review1;
  List<String> tickets;
  List<String> reviews;
  List<String> photos;

  Garage({
    required this.name,
    required this.location,
    required this.contactNumber,
    required this.reviewname1,
    required this.review1,
    this.tickets = const [],
    this.reviews = const [],
    this.photos = const [],
  });

  get imageUrl => null;
}

List<Garage> garageList = [
  Garage(
    name: 'Raza Motor Garage',
    location:
        '3VJQ+PW2, OPP. SHIV MANDIR, R.B. MARG, DR. VIDYAVIHAR ROAD, NAVPADA,, Ambedkar Nagar, Kurla West, Kurla, Mumbai, Maharashtra 400070',
    contactNumber: '08652803951',
    reviewname1: 'Dwayne Nixon',
    review1: 'Great service, very professional and \nfriendly staff.',
    tickets: [
      // Add tickets for this garage
    ],
    reviews: [
      // Add reviews for this garage
    ],
    photos: [
      // Add photos for this garage
    ],
  ),
  Garage(
      name: 'Garage 2',
      location: 'Location 2',
      contactNumber: 'Phone 2',
      tickets: [
        // Add tickets for this garage
      ],
      reviews: [
        // Add reviews for this garage
      ],
      photos: [
        // Add photos for this garage
      ],
      reviewname1: '0',
      review1: '0'),
  Garage(
      name: 'Garage 3',
      location: 'Location 3',
      contactNumber: 'Phone 3',
      tickets: [
        // Add tickets for this garage
      ],
      reviews: [
        // Add reviews for this garage
      ],
      photos: [
        // Add photos for this garage
      ],
      reviewname1: '0',
      review1: '0'),
  Garage(
      name: 'Garage 4',
      location: 'Location 4',
      contactNumber: 'Phone 4',
      tickets: [
        // Add tickets for this garage
      ],
      reviews: [
        // Add reviews for this garage
      ],
      photos: [
        // Add photos for this garage
      ],
      reviewname1: '0',
      review1: '0'),
];
