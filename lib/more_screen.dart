import 'package:akasa_air_demo_project/book_flight_screen.dart';
import 'package:akasa_air_demo_project/component.dart';
import 'package:akasa_air_demo_project/home_screen.dart';
import 'package:akasa_air_demo_project/profile_screen.dart';
import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
 int _currentIndex = 3;

  // Screens List
  final List<Widget> _screens = [
    const HomeScreen(),
    const BookFlightScreen(),
    const ProfileScreen(),
    MoreScreen(),
  ];
  final List<Map<String, String>> menuItems = [
    {"title": "Add-Ons", "route": "/addons"},
    {"title": "Privacy Policy", "route": "/privacyPolicy"},
    {"title": "Terms and Conditions", "route": "/terms"},
    {
      "title": "Conditions of Carriage - Domestic",
      "route": "/domesticConditions"
    },
    {
      "title": "Conditions of Carriage - International",
      "route": "/internationalConditions"
    },
    {"title": "Contact Us", "route": "/contactUs"},
    {"title": "Flight Schedule", "route": "/flightSchedule"},
    {"title": "Refund Status", "route": "/refundStatus"},
    {"title": "FAQs", "route": "/faqs"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("More"),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      body: Column(
        children: [
          // Line below the AppBar
          Container(
  height: 1.5,
  decoration: BoxDecoration(
    color: Colors.grey.shade500,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade400,
        blurRadius: 2,
        offset: Offset(0, 2),
      ),
    ],
  ),
),

          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        menuItems[index]["title"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 33, 33, 33),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          menuItems[index]["route"]!,
                        );
                      },
                    ),
                    const Divider(height: 1),
                  ],
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Text(
              "Version 1.27.4+109",
              style: TextStyle(
                color: Color.fromARGB(255, 61, 61, 61),
                fontSize: 16,
              ),
            ),
          ),
        ],
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

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MoreScreen(),
      // '/home': (context) => PlaceholderScreen(title: "Home"),
      // '/book': (context) => PlaceholderScreen(title: "Book"),
      // '/me': (context) => PlaceholderScreen(title: "Me"),
      '/addons': (context) => PlaceholderScreen(title: "Add-Ons"),
      '/privacyPolicy': (context) => PlaceholderScreen(title: "Privacy Policy"),
      '/terms': (context) => PlaceholderScreen(title: "Terms and Conditions"),
      '/domesticConditions': (context) =>
          PlaceholderScreen(title: "Domestic Conditions"),
      '/internationalConditions': (context) =>
          PlaceholderScreen(title: "International Conditions"),
      '/contactUs': (context) => PlaceholderScreen(title: "Contact Us"),
      '/flightSchedule': (context) =>
          PlaceholderScreen(title: "Flight Schedule"),
      '/refundStatus': (context) => PlaceholderScreen(title: "Refund Status"),
      '/faqs': (context) => PlaceholderScreen(title: "FAQs"),
    },
  ));
}

class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(
          "Placeholder for $title",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
