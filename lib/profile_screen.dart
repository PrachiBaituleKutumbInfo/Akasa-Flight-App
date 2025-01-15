import 'package:akasa_air_demo_project/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
    );
  }
}