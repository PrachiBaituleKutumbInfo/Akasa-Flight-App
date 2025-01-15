import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookFlightScreen extends StatefulWidget {
  const BookFlightScreen({super.key});

  @override
  State<BookFlightScreen> createState() => _BookFlightScreenState();
}

class _BookFlightScreenState extends State<BookFlightScreen> {
  // State to toggle between One Way and Round Trip
  bool isOneWaySelected = true;
  // Controllers for input fields
  TextEditingController promoCodeController = TextEditingController();

  // Variables for dropdowns and date pickers
  String fromCity = "Delhi";
  String toCity = "Mumbai";
  DateTime? departureDate;
  DateTime? returnDate;
  int passengerCount = 1;
  String currency = "Indian Rupee";

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
            Row(
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
                          color: isOneWaySelected
                              ? Colors.deepOrange
                              : Colors.black,
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
                          color: !isOneWaySelected
                              ? Colors.deepOrange
                              : Colors.black,
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
            ),
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

            const SizedBox(height: 20),

            // From and To Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "From",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      DropdownButton<String>(
                        isExpanded: true,
                        value: fromCity,
                        items: <String>['Delhi', 'Mumbai', 'Chennai', 'Kolkata']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            fromCity = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  child: SvgPicture.asset(
                    'assets/svg/swap-icon.svg',
                  ),
                  backgroundColor: Colors.deepOrange,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "To",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      DropdownButton<String>(
                        isExpanded: true,
                        value: toCity,
                        items: <String>['Delhi', 'Mumbai', 'Chennai', 'Kolkata']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            toCity = newValue!;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Departure Date and Return Date
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Departure Date",
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              departureDate = pickedDate;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          height: 50,
                          child: Row(
                            children: [
                              Text(
                                departureDate != null
                                    ? "${departureDate!.day}/${departureDate!.month}/${departureDate!.year}"
                                    : "Select Date",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(Icons.calendar_today),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Return Date",
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(height: 4),
                      GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              returnDate = pickedDate;
                            });
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          height: 50,
                          child: Row(
                            children: [
                              Text(
                                returnDate != null
                                    ? "${returnDate!.day}/${returnDate!.month}/${returnDate!.year}"
                                    : "Select Date",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              const Icon(Icons.calendar_today),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
            const SizedBox(height: 15.0),

            const Text(
              "Passenger(s)",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 4),
            DropdownButton<int>(
              isExpanded: true,
              value: passengerCount,
              items: List.generate(10, (index) => index + 1).map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text("$value Adult"),
                );
              }).toList(),
              onChanged: (int? newValue) {
                setState(() {
                  passengerCount = newValue!;
                });
              },
            ),

            const SizedBox(height: 15),

            // Promo Code Field
            const Text(
              "Promo Code",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 4),
            TextField(
              controller: promoCodeController,
              decoration: const InputDecoration(
                hintText: "Got a special code? Add it here for discounts",
              ),
            ),
            const SizedBox(height: 20),

            // Currency Dropdown
            const Text(
              "Currency",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 4),
            DropdownButton<String>(
              isExpanded: true,
              value: currency,
              items:
                  <String>['Indian Rupee', 'USD', 'Euro'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  currency = newValue!;
                });
              },
            ),
            const SizedBox(height: 10),

            // Special Fares
            const Text(
              "Special fares",
              style: TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(
                  label: const Text("Armed Forces"),
                  backgroundColor: Colors.orange.withOpacity(0.1),
                ),
                Chip(
                  label: const Text("Medical Professionals"),
                  backgroundColor: Colors.orange.withOpacity(0.1),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Search Flights Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Search flights logic
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Promo Text
            const Center(
              child: Text(
                "Up to 20% off: Use code FLYMORE",
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
