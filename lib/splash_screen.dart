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
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
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
    
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // App Logo (SVG)
              Padding(
                padding: const EdgeInsets.only(bottom: 160.0),
                child: SvgPicture.asset(
                  'assets/svg/logo_akasa.svg', // Add your SVG logo
                  height: 80,
                  width: 60,
                ),
              ),
             const SizedBox(height: 20),
              // App Name
            ],
          ),
        ],
      ),
    );
  }
}
