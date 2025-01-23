import 'package:flutter/material.dart';

class SearchFlightsScreen extends StatefulWidget {
  const SearchFlightsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchFlightsScreenState createState() => _SearchFlightsScreenState();
}

class _SearchFlightsScreenState extends State<SearchFlightsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // 4 date tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text(
              "Bengaluru → Mumbai",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            SizedBox(height: 4),
             Text(
              "17 Jan 2025 • 1 Passenger",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today_outlined, color: Colors.black),
            onPressed: () {
              // Add calendar functionality here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab Bar for Dates
          Container(
            color: Colors.white,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.deepOrange,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.deepOrange,
              tabs: const [
                Tab(text: "Thu, 17 Jan"),
                Tab(text: "Fri, 18 Jan"),
                Tab(text: "Sat, 19 Jan"),
                Tab(text: "Sun, 20 Jan"),
              ],
            ),
          ),

          // Filter Buttons (Price, Duration, Departure time)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterButton("Price"),
                _buildFilterButton("Duration"),
                _buildFilterButton("Departure time"),
              ],
            ),
          ),

          // Flight List
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: List.generate(4, (index) => _buildFlightList()),
            ),
          ),
        ],
      ),
    );
  }

  // Filter Button Widget
  Widget _buildFilterButton(String label) {
    return ElevatedButton.icon(
      onPressed: () {
        // Handle filter logic
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey[200],
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      icon: const Icon(Icons.sort, size: 16),
      label: Text(label),
    );
  }

  // Flight List Widget
  Widget _buildFlightList() {
    final flights = [
      {
        "time": "03:50 - 05:35",
        "duration": "1hr 45min • Non-stop",
        "price": "₹16,888",
        "flightNumber": "QP1194",
        "isLowestFare": true,
      },
      {
        "time": "06:20 - 08:05",
        "duration": "1hr 45min • Non-stop",
        "price": "₹20,118",
        "flightNumber": "QP1736",
        "isLowestFare": false,
      },
      {
        "time": "08:10 - 09:55",
        "duration": "1hr 45min • Non-stop",
        "price": "₹21,119",
        "flightNumber": "QP1375",
        "isLowestFare": false,
      },
      {
        "time": "21:30 - 23:15",
        "duration": "1hr 45min • Non-stop",
        "price": "₹21,119",
        "flightNumber": "QP1366",
        "isLowestFare": false,
      },
    ];

    return ListView.builder(
      itemCount: flights.length,
      itemBuilder: (context, index) {
        final flight = flights[index];
        return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10),
  child: Card(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.flight, color: Colors.purple),
              const SizedBox(height: 4),
              Text(
                flight['flightNumber'] as String,
                style: const TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  flight['time'] as String,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  flight['duration'] as String,
                  style: const TextStyle(fontSize: 12),
                ),
                if (flight['isLowestFare'] == true)
                  const Text(
                    "Lowest fare",
                    style: TextStyle(fontSize: 12, color: Colors.green),
                  ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                flight['price'] as String,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                height: 36,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle flight selection
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Select",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);

      },
    );
  }
}
