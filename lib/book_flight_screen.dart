import 'package:akasa_air_demo_project/component.dart';
import 'package:akasa_air_demo_project/home_screen.dart';
import 'package:akasa_air_demo_project/more_screen.dart';
import 'package:akasa_air_demo_project/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'city_selection_screen.dart';
import 'date_selection_screen.dart';
import 'passenger_selection_screen.dart';
import 'currency_selection_screen.dart';
import 'search_flights_screen.dart';

class BookFlightScreen extends StatefulWidget {
  const BookFlightScreen({super.key});

  @override
  State<BookFlightScreen> createState() => _BookFlightScreenState();
}

class _BookFlightScreenState extends State<BookFlightScreen> {

  int _currentIndex = 1;

  // Screens List
  final List<Widget> _screens = [
    const HomeScreen(),
    const BookFlightScreen(),
    const ProfileScreen(),
    MoreScreen(),
  ];
  
  bool isOneWaySelected = true;
  TextEditingController promoCodeController = TextEditingController();
  String fromCity = "Delhi";
  String toCity = "Mumbai";
  DateTime? departureDate;
  DateTime? returnDate;
  int passengerCount = 1;
  String currency = "₹ - Indian Rupee";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Book a flight"),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // One Way / Round Trip toggle
            _buildOneWayRoundTripToggle(),
            _buildDivider(),
            const SizedBox(height: 20),
            _buildFromToFields(),
            const SizedBox(height: 20),
            _buildDepartureReturnDate(),
            const Divider(height: 1, color: Colors.grey),
            const SizedBox(height: 15.0),
            _buildPassengerField(),
            const SizedBox(height: 15),
            _buildPromoCodeField(),
            const SizedBox(height: 20),
            _buildCurrencyDropdown(),
            const SizedBox(height: 10),
            _buildSpecialFares(),
            const SizedBox(height: 20),
            _buildSearchButton(),
            const SizedBox(height: 10),
            _buildPromoText(),
          ]),
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
            _buildNavItem(Icons.home, 'Home', 0),
            _buildNavItem(Icons.flight, 'Book', 1),
            _buildNavItem(Icons.account_circle_outlined, 'Me', 2),
            _buildNavItem(Icons.more_horiz, 'More', 3),
          ],
        ),
    );
  }

  // Toggle for One Way and Round Trip
  Widget _buildOneWayRoundTripToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isOneWaySelected = true;
            });
          },
          child: Column(
            children: [
              Text(
                "One Way",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: isOneWaySelected ? Colors.deepOrange : Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              if (isOneWaySelected)
                Container(
                  height: 2,
                  width: 160,
                  color: Colors.deepOrange,
                ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isOneWaySelected = false;
            });
          },
          child: Column(
            children: [
              Text(
                "Round Trip",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: !isOneWaySelected ? Colors.deepOrange : Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              if (!isOneWaySelected)
                Container(
                  height: 2,
                  width: 160,
                  color: Colors.deepOrange,
                ),
            ],
          ),
        ),
      ],
    );
  }

  // Divider line
  Widget _buildDivider() {
    return Container(
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
    );
  }

  // From and To fields
  Widget _buildFromToFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: _buildFromCityField()),
        CircleAvatar(
          child: SvgPicture.asset('assets/svg/swap-icon.svg'),
          backgroundColor: Colors.deepOrange,
        ),
        const SizedBox(width: 10),
        Expanded(child: _buildToCityField()),
      ],
    );
  }

  // From city field
 Widget _buildFromCityField() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "From",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 4),
      GestureDetector(
        onTap: () async {
          final selectedCity = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CitySelectionScreen(
                title: "Flying From",
                onCitySelected: (city) {
                  Navigator.pop(context, city); // Return the city to the parent
                },
              ),
            ),
          );
          if (selectedCity != null) {
            setState(() {
              fromCity = selectedCity; // Update the fromCity variable
            });
          }
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.grey),
            // borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Text(
                fromCity ?? "Select City", // Display placeholder if null
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              const Icon(Icons.arrow_drop_down),
            ],
          ),
        ),
      ),
    ],
  );
}

  // To city field
  Widget _buildToCityField() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      const Text(
        "To",
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 4),
      GestureDetector(
        onTap: () async {
          final selectedCity = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CitySelectionScreen(
                title: "Flying To",
                onCitySelected: (city) {
                  Navigator.pop(context, city); // Return the selected city
                },
              ),
            ),
          );
          if (selectedCity != null) {
            setState(() {
              toCity = selectedCity; // Update the toCity variable
            });
          }
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            // border: Border.all(color: Colors.grey),
            // borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
               const Icon(Icons.arrow_drop_down),
               const Spacer(),
              Text(
                toCity ?? "Select Destination", // Display placeholder if null
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
             
            ],
          ),
        ),
      ),
    ],
  );
}


  // Departure and Return Date
  Widget _buildDepartureReturnDate() {
    return Row(
      children: [
        Expanded(child: _buildDepartureDateField()),
        const SizedBox(width: 10),
        Expanded(child: _buildReturnDateField()),
      ],
    );
  }

  // Departure date field
  Widget _buildDepartureDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Departure Date", style: TextStyle(fontSize: 12)),
        const SizedBox(height: 4),
       GestureDetector(
  onTap: () async {
    final selectedDate = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DepartureDateScreen(),
      ),
    );
    if (selectedDate != null) {
      setState(() {
        departureDate = selectedDate;
      });
    }
  },
  child: Container(
    height: 50,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          departureDate != null
              ? "${departureDate?.day}/${departureDate?.month}/${departureDate?.year}"
              : "Fri, 17 Jan 2025",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        // const Icon(Icons.calendar_today),
      ],
    ),
  ),
),

      ],
    );
  }

  // Return date field
  Widget _buildReturnDateField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text("Return Date", style: TextStyle(fontSize: 12)),
        const SizedBox(height: 4),
        GestureDetector(
  onTap: () async {
    final selectedDate = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ReturnDateScreen(),
      ),
    );
    if (selectedDate != null) {
      setState(() {
        returnDate = selectedDate;
      });
    }
  },
  child: Container(
    height: 50,
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          returnDate != null
              ? "${returnDate?.day}/${returnDate?.month}/${returnDate?.year}"
              : "Fri, 17 Jan 2025",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        // const Icon(Icons.calendar_today),
      ],
    ),
  ),
),

      ],
    );
  }

  // Passenger(s) field
  Widget _buildPassengerField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Passenger(s)", style: TextStyle(fontSize: 12)),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () async {
            final selectedPassengerCount = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    PassengerSelectionScreen(initialCount: passengerCount),
              ),
            );
            if (selectedPassengerCount != null) {
              setState(() {
                passengerCount = selectedPassengerCount;
              });
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 50,
            child: Row(
              children: [
                Text(
                  "$passengerCount Adult",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        Divider(color: Colors.grey,)
      ],
    );
  }

  // Promo Code field
  Widget _buildPromoCodeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Promo Code", style: TextStyle(fontSize: 12)),
        const SizedBox(height: 4),
        TextField(
          controller: promoCodeController,
          decoration: const InputDecoration(
            hintText: "Got a special code? Add it here for discounts",
          ),
        ),
      ],
    );
  }

  // Currency dropdown
  Widget _buildCurrencyDropdown() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Currency", style: TextStyle(fontSize: 12)),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () async {
            final selectedCurrency = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    CurrencySelectionScreen(selectedCurrency: currency),
              ),
            );
            if (selectedCurrency != null) {
              setState(() {
                currency = selectedCurrency;
              });
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 50,
            child: Row(
              children: [
                Text(
                  currency,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        Divider( color: Colors.grey,)
      ],
    );
  }
  

  // Special fares section
 Widget _buildSpecialFares() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          const Text(
            "Special Fares",
            style: TextStyle(fontSize: 12),
          ),
          SizedBox(width: 5),
          Icon(Icons.info_outline_rounded, color: Colors.black,)
        ],
      ),
      const SizedBox(height: 8),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Enable horizontal scrolling
        child: Row(
          children: [
            _buildChip("Armed Forces"),
            _buildChip("Medical Professionals"),
            _buildChip("Senior Citizen"),
            _buildChip("Student"),
            _buildChip("Unaccompanied Minor"),
          ],
        ),
      ),
    ],
  );
}

Widget _buildChip(String label) {
  return GestureDetector(
    onTap: () {
      // Action when the chip is tapped
      print("$label tapped");
    },
    child: Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        label: Text(label),
        backgroundColor: const Color.fromARGB(255, 237, 235, 235),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}


  // Search button
  Widget _buildSearchButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SearchFlightsScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrange,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8)),
          ),
        ),
        child: const Text(
          "Search Flights",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }

  // Promo Text
  Widget _buildPromoText() {
    return const Center(
      child: Text(
        "Up to 20% off: Use code FLYMORE",
        style: TextStyle(
            color: Colors.purple, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }

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
}
