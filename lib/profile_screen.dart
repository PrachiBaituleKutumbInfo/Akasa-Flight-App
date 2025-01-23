import 'package:akasa_air_demo_project/book_flight_screen.dart';
import 'package:akasa_air_demo_project/home_screen.dart';
import 'package:akasa_air_demo_project/login_screen.dart';
import 'package:akasa_air_demo_project/more_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 2;

  // Screens List
  final List<Widget> _screens = [
    const HomeScreen(),
    const BookFlightScreen(),
    const ProfileScreen(),
    MoreScreen(),
  ];
  
   @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
       backgroundColor: Colors.white,
      // appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.only(top: 35.0),
        child: Container(
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
      ),
       bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
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
            _buildNavItem(Icons.home_outlined, 'Home', 0),
            _buildNavItem(Icons.flight, 'Book', 1),
            _buildNavItem(Icons.account_circle_outlined, 'Me', 2),
            _buildNavItem(Icons.more_horiz, 'More', 3),
          ],
        ),
    );
  }
  BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _currentIndex == index;

    return BottomNavigationBarItem(
      backgroundColor: Colors.white,
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