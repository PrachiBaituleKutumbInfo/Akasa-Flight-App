import 'package:akasa_air_demo_project/book_flight_screen.dart';
import 'package:akasa_air_demo_project/check_in_screen.dart';
import 'package:akasa_air_demo_project/component.dart';
import 'package:akasa_air_demo_project/flight_status_screen.dart';
import 'package:akasa_air_demo_project/login_screen.dart';
import 'package:akasa_air_demo_project/manage_screen.dart';
import 'package:akasa_air_demo_project/more_screen.dart';
import 'package:akasa_air_demo_project/profile_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const Center(child: Text('Home Screen')),
    const Center(child: Text('Book Screen')),
    const Center(child: Text('Profile Screen')),
    const Center(child: Text('More Screen')),
  ];

  final List<String> _carouselImages = [
    'assets/images/slide1.jpg',
    'assets/images/slide2.webp',
    'assets/images/slide3.jpg',
    'assets/images/slide4.webp',
    'assets/images/slide5.webp',
    'assets/images/slide6.webp',
  ];

  final List<Map<String, String>> _cityData = [
    {'name': 'Abu Dhabi', 'image': 'assets/images/abu_dhabi.jpg'},
    {'name': 'Agartala', 'image': 'assets/images/agartala.webp'},
    {'name': 'Ahmedabad', 'image': 'assets/images/ahmedabad.jpg'},
    {'name': 'Ayodhya', 'image': 'assets/images/ayodhya.jpg'},
    {'name': 'Bagdogra', 'image': 'assets/images/bagdogra.webp'},
    {'name': 'Bengaluru', 'image': 'assets/images/bengaluru.jpg'},
    {'name': 'Bhubaneswar', 'image': 'assets/images/bhubaneswar.jpg'},
    {'name': 'Chennai', 'image': 'assets/images/chennai.jpg'},
    {'name': 'Delhi', 'image': 'assets/images/delhi.png'},
    {'name': 'Doha', 'image': 'assets/images/doha.jpeg'},
    {'name': 'Goa', 'image': 'assets/images/goa.jpg'},
    {'name': 'Gorakhpur', 'image': 'assets/images/gorakhpur.jpg'},
    {'name': 'Guwahati', 'image': 'assets/images/guwahati.jpg'},
    {'name': 'Gwalior', 'image': 'assets/images/gwalior.jpg'},
    {'name': 'Hyderabad', 'image': 'assets/images/hydrabad.jpg'},
    {'name': 'Jeddah', 'image': 'assets/images/jeddah.jpg'},
    {'name': 'Kochi', 'image': 'assets/images/kochi.jpg'},
    {'name': 'Kolkata', 'image': 'assets/images/kolkata.webp'},
    {'name': 'Kuwait', 'image': 'assets/images/kuwait.jpg'},
    {'name': 'Lucknow', 'image': 'assets/images/lucknow.webp'},
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Section with Carousel and Overlapping Container
              Stack(
                clipBehavior: Clip.none, // Allows overlapping elements to show
                children: [
                  // Carousel
                  CarouselSlider(
                    options: CarouselOptions(
                      height: size.height * 0.35,
                      autoPlay: true,
                      enlargeCenterPage: false,
                      viewportFraction: 1.0,
                      aspectRatio: 16 / 9,
                      autoPlayInterval: const Duration(seconds: 3),
                    ),
                    items: _carouselImages.asMap().entries.map((entry) {
                      final index = entry.key;
                      final imagePath = entry.value;

                      return Stack(
                        children: [
                          // Background Image
                          ClipRRect(
                            borderRadius: BorderRadius.zero,
                            child: Container(
                              width:
                                  size.width, // Ensure full width of the screen
                              height: size.height *
                                  0.35, // Ensure consistent height
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(imagePath),
                                  fit: BoxFit
                                      .cover, // Cover ensures the image fills the box
                                ),
                              ),
                            ),
                          ),
                          // Custom Text Overlay
                          if (index == 0)
                            const SlideContent(
                              title: '2025 Travel Sale',
                              subtitle: 'Up to',
                              discount: '25% off',
                              details: 'on flights',
                              codeLabel: 'Use code: ',
                              promoCode: 'FESTIVE',
                            ),
                          if (index == 1)
                            const SlideContent(
                              title: 'Book early, save more.',
                              subtitle: 'Fly in',
                              discount: '2025',
                              details: 'with',
                              codeLabel: 'fares starting at',
                              promoCode: 'Rs. 1,499',
                            ),
                          if (index == 2)
                            const SlideContent(
                              title: 'Hello, Abu Dhabi.',
                              subtitle: 'Now connecting Ahmedabad',
                              discount: '',
                              details: '& Bengaluru to Abu Dhabi',
                              codeLabel: 'Starting 1 Mar 2025',
                              promoCode: '',
                            ),
                          if (index == 3)
                            const SlideContent(
                              title: 'Take your learning further',
                              subtitle: 'Students can enjoy',
                              discount: 'Flat 7% off',
                              details: 'on flights',
                              codeLabel: '10 kgs ',
                              promoCode: 'additional baggage',
                            ),
                          if (index == 5)
                            const SlideContent(
                              title: 'Sit back before you set off',
                              subtitle: 'Pre-book our lounge',
                              discount: '',
                              details: 'services at aspecial rates',
                              codeLabel: '',
                              promoCode: '',
                            ),
                        ],
                      );
                    }).toList(),
                  ),

                  // Overlapping Container
                  Positioned(
                    bottom: -150, // Slight overlap on the carousel
                    left: 16,
                    right: 16,
                    child: Column(
                      children: [
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              // Navigate to BookFlightScreen
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const BookFlightScreen(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 10.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: Row(
                                
                                children: [
                                  
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: SvgPicture.asset(
                                      'assets/svg/book_flight.svg',
                                      height: 50,
                                      width: 50,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Book a flight',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Plan your next trip with us',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // Navigate to CheckInScreen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          CheckInScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: _buildActionButton(
                                    icon: SvgPicture.asset(
                                      'assets/svg/checkin.svg',
                                      height: 30,
                                      width: 30,
                                    ),
                                    label: 'Check-in',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // Navigate to FlightStatusScreen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const FlightStatusScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: _buildActionButton(
                                    icon: SvgPicture.asset(
                                      'assets/svg/flight_status.svg',
                                      height: 30,
                                      width: 30,
                                    ),
                                    label: 'Flight status',
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  // Navigator to ManageBookingScreen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ManageScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: _buildActionButton(
                                    icon: SvgPicture.asset(
                                      'assets/svg/manage.svg',
                                      height: 30,
                                      width: 30,
                                    ),
                                    label: 'Manage',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    
                  ),
                ],
              ),
              const SizedBox(height: 190),
              Container(
                width: double.infinity, // Full screen width
                height: size.height * 0.25, // Adjust height as needed
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/loginback.jpg'),
                    fit: BoxFit.cover, // Ensures it fills the width
                  ),
                ),
                child: Stack(
                  children: [
                    // Heading
                    const Positioned(
                      top: 20,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign up for a personalised experience',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 10),
                          // Features List
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '* Breeze Post Booking',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                  SizedBox(width: 25.0),
                                  Text(
                                    '* Manage Preferences',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    '* Faster Check-in',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                  SizedBox(width: 60.0),
                                  Text(
                                    '* Timely Notifications',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Login Button
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: ElevatedButton(
                        onPressed: () {
                           Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );

                          // Handle Login action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              Container(
                width: double.infinity, // Full screen width
                height: size.height * 0.25, // Adjust height as needed
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/upto20.webp'),
                    fit: BoxFit.cover, // Ensures it fills the width
                  ),
                ),
                child: Stack(
                  children: [
                    // Heading
                    const Positioned(
                      top: 20,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sign up and save big',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                          SizedBox(height: 10),
                          // Features List
                          Row(
                            children: [
                              Text(
                                'Use code: ',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Text(
                                'FLYMORE',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Login Button
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Login action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: const Text(
                          'Know More',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 45.0),
              Container(
                width: double.infinity, // Full screen width
                height: size.height * 0.25, // Adjust height as needed
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/senior_citizen.webp'),
                    fit: BoxFit.cover, // Ensures it fills the width
                  ),
                ),
                child: Stack(
                  children: [
                    // Heading
                    const Positioned(
                      top: 20,
                      left: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Step up your travel experience',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange,
                            ),
                          ),
                          SizedBox(height: 10),
                          // Features List
                          Text(
                            'Explore our Add-Ons services',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    // Login Button
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle Login action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: const Text(
                          'Know More',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),
              Container(
                padding: const EdgeInsets.only(left: 15.0),
                child: const Text(
                  'Not sure where to go? Explore.',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15.0),

              CarouselSlider(
                options: CarouselOptions(
                  height: 200, // Ensures a consistent square height
                  autoPlay: true,
                  enlargeCenterPage: false,
                  viewportFraction: 0.6, // Adjusts spacing between images
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: _cityData.map((city) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Stack(
                        children: [
                          // Square Image Container
                          Container(
                            width: 200, // Fixed square width
                            height: 200, // Fixed square height
                            margin: const EdgeInsets.symmetric(horizontal: 3.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(city['image']!),
                                fit: BoxFit
                                    .cover, // Ensures the image fills the box
                              ),
                            ),
                          ),
                          // Text on Bottom Left
                          Positioned(
                            left: 10,
                            bottom: 10,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                city[
                                    'name']!, // Replace with dynamic city name if required
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          // Circular Icon Button on Bottom Right
                          Positioned(
                            right: 10,
                            bottom: 10,
                            child: IconButton(
                              icon: SvgPicture.asset(
                                'assets/svg/book_flight.svg',
                                height: 35,
                                width: 35,
                              ),
                              onPressed: () {
                                // Handle button action here
                              },
                              iconSize: 18,
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 30.0),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Color.fromARGB(255, 89, 88, 88),
          showUnselectedLabels: true,
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Update the selected index
            });

            // Add navigation logic here
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BookFlightScreen()),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MoreScreen()),
                );
                break;
            }
          },
          items: [
            _buildNavItem(Icons.home, 'Home', 0),
            _buildNavItem(Icons.flight, 'Book', 1),
            _buildNavItem(Icons.account_circle_outlined, 'Me', 2),
            _buildNavItem(Icons.more_horiz, 'More', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({required Widget icon, required String label}) {
    return Column(
      children: [
        icon,
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
      ],
    );
  }

  BottomNavigationBarItem _buildNavItem(
      IconData icon, String label, int index) {
    final isSelected = _currentIndex == index;

    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.orange.withOpacity(0.2)
              : Colors.transparent, // Background for selected
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(8),
        child: Icon(
          icon,
          color: isSelected ? Colors.deepOrange : Colors.grey,
        ),
      ),
      label: label,
    );
  }
}
