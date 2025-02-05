import 'package:flutter/material.dart';

class CitySelectionScreen extends StatefulWidget {
  final String title;
  final Function(String) onCitySelected;

  const CitySelectionScreen({
    Key? key,
    required this.title,
    required this.onCitySelected,
  }) : super(key: key);

  @override
  _CitySelectionScreenState createState() => _CitySelectionScreenState();
}

class _CitySelectionScreenState extends State<CitySelectionScreen> {
  final List<Map<String, String>> cities = [
    {
      "code": "BOM",
      "name": "Mumbai",
      "airport": "Chhatrapati Shivaji Maharaj International Airport"
    },
    {
      "code": "AUH",
      "name": "Abu Dhabi",
      "airport": "Zayed International Airport"
    },
    {
      "code": "IXA",
      "name": "Agartala",
      "airport": "Maharaja Bir Bikram Airport"
    },
    {
      "code": "AMD",
      "name": "Ahmedabad",
      "airport": "Sardar VallabhBhai Patel International Airport"
    },
    {
      "code": "AYJ",
      "name": "Ayodhya",
      "airport": "Maharishi Valmiki International Airport, Ayodhya Dham"
    },
    {
      "code": "IXB",
      "name": "Bagdogra",
      "airport": "Bagdogra International Airport"
    },
    {
      "code": "BLR",
      "name": "Bengaluru",
      "airport": "Kempegowda International Airport"
    },
    {
      "code": "BBI",
      "name": "Bhubaneshwar",
      "airport": "Biju Patnaik Internation Airport"
    },
    {
      "code": "MMA",
      "name": "Chennai",
      "airport": "Chennai International Airport"
    },
    {
      "code": "DEL",
      "name": "Delhi",
      "airport": "Indira Gandhi International Airport"
    },
    {"code": "DOH", "name": "Doha", "airport": "Hamad International Airport"},
    {
      "code": "GOX",
      "name": "North Goa",
      "airport": "Manohar International Airport, Goa"
    },
    {
      "code": "GOP",
      "name": "Gorakhpur",
      "airport": "Mahayogi Gorakhnath Airport"
    },
    {
      "code": "GAU",
      "name": "Guwahati",
      "airport": "Lokpriya Gopinath Bordoloi International Airport"
    },
  ];

  String query = '';

  @override
  Widget build(BuildContext context) {
    // Filter the cities based on the user's search query
    final filteredCities = cities.where((city) {
      final cityName = city["name"]!.toLowerCase();
      final airportName = city["airport"]!.toLowerCase();
      final searchQuery = query.toLowerCase();

      return cityName.contains(searchQuery) ||
          airportName.contains(searchQuery);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // Dynamic title for the screen
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  query = value; // Update query on search input
                });
              },
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: "Search For City/Airport",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Our destinations",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCities.length,
                itemBuilder: (context, index) {
                  final city = filteredCities[index];
                  return ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        city["code"]!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Text(city["name"]!),
                    subtitle: Text(city["airport"]!),
                    onTap: () {
  widget.onCitySelected(city["name"]!); // Trigger the callback
  Navigator.pop(context, city["name"]!); // Pass the selected city
},

                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
