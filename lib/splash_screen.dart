import 'dart:async';
import 'package:akasa_air_demo_project/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool _isLogoPositioned; // To control the animation state

  @override
  void initState() {
    super.initState();
    _isLogoPositioned = false; // Start with the logo at the bottom
    Timer(Duration(milliseconds: 500), () {
      // Trigger animation after a short delay
      setState(() {
        _isLogoPositioned = true;
      });
    });

    Timer(Duration(seconds: 3), () {
      // Navigate to LoginScreen after 3 seconds
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/images/screen.jpeg', // Add your background image
            fit: BoxFit.cover,
          ),
          // Foreground Content (Logo and App Name)
    
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 35.0),
           child: Stack(
              children: [
                // Animated logo
                AnimatedPositioned(
                  duration: Duration(milliseconds: 1500), // Animation duration
                  curve: Curves.easeInOut, // Smooth animation
                  bottom: _isLogoPositioned ? 250 : -100, // Final & initial positions
                  // left: MediaQuery.of(context).size.width / 2 - 40, // Center the logo
                  child: SvgPicture.asset(
                    'assets/svg/logo_akasa.svg', // Add your SVG logo
                    height: 80,
                    width: 40,
                  ),
                ),
               const SizedBox(height: 20),
                // App Name
              ],
            ),
         ),
        ],
      ),
    );
  }
}
