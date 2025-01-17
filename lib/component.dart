import 'package:akasa_air_demo_project/book_flight_screen.dart';
import 'package:akasa_air_demo_project/home_screen.dart';
import 'package:akasa_air_demo_project/more_screen.dart';
import 'package:akasa_air_demo_project/profile_screen.dart';
import 'package:flutter/material.dart';

class SlideContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String discount;
  final String details;
  final String codeLabel;
  final String promoCode;

  const SlideContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.discount,
    required this.details,
    required this.codeLabel,
    required this.promoCode,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30, // Position at the bottom
      left: 16, // Padding from left
      right: 16, // Padding from right
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$title\n',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: subtitle,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: ' $discount ',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: '$details\n',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: codeLabel,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.white,
              ),
            ),
            TextSpan(
              text: promoCode,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PersistentBottomNav extends StatefulWidget {
  const PersistentBottomNav({super.key});

  @override
  State<PersistentBottomNav> createState() => _PersistentBottomNavState();
}

class _PersistentBottomNavState extends State<PersistentBottomNav> {
  int _currentIndex = 0;

  // Screens List
  final List<Widget> _screens = [
    const HomeScreen(),
    const BookFlightScreen(),
    const ProfileScreen(),
    MoreScreen(),
  ];

  // Bottom Navigation Bar Item Builder
  BottomNavigationBarItem _buildNavItem(IconData icon, String label, int index) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: const Color.fromARGB(255, 89, 88, 88),
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          _buildNavItem(Icons.home, 'Home', 0),
          _buildNavItem(Icons.flight, 'Book', 1),
          _buildNavItem(Icons.account_circle_outlined, 'Me', 2),
          _buildNavItem(Icons.more_horiz, 'More', 3),
        ],
      ),
    );
  }
}