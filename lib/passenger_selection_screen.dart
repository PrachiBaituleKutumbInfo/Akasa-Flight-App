import 'package:flutter/material.dart';

class PassengerSelectionScreen extends StatefulWidget {
  final Map<String, int> initialCounts;

  PassengerSelectionScreen({required this.initialCounts});

  @override
  _PassengerSelectionScreenState createState() =>
      _PassengerSelectionScreenState();
}

class _PassengerSelectionScreenState extends State<PassengerSelectionScreen> {
  late int adults;
  late int seniorCitizens;
  late int children;
  late int infants;
  late int extraSeats;

  @override
  void initState() {
    super.initState();
    adults = widget.initialCounts["adults"] ?? 1;
    seniorCitizens = widget.initialCounts["seniorCitizens"] ?? 0;
    children = widget.initialCounts["children"] ?? 0;
    infants = widget.initialCounts["infants"] ?? 0;
    extraSeats = widget.initialCounts["extraSeats"] ?? 0;
  }

  Widget _buildPassengerRow(
      String label, int count, VoidCallback onAdd, VoidCallback onRemove) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              IconButton(
                onPressed: count > 0 ? onRemove : null,
                icon: const Icon(Icons.remove_circle_outline),
                color: count > 0 ? Colors.deepOrange : Colors.grey,
              ),
              Text(
                "$count",
                style: const TextStyle(fontSize: 16),
              ),
              IconButton(
                onPressed: onAdd,
                icon: const Icon(Icons.add_circle_outline),
                color: Colors.deepOrange,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Select Passenger(s)",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          _buildPassengerRow(
            "Adult(s)",
            adults,
            () => setState(() => adults++),
            () => setState(() => adults--),
          ),
          _buildPassengerRow(
            "Senior Citizen(s)",
            seniorCitizens,
            () => setState(() => seniorCitizens++),
            () => setState(() => seniorCitizens--),
          ),
          _buildPassengerRow(
            "Children",
            children,
            () => setState(() => children++),
            () => setState(() => children--),
          ),
          _buildPassengerRow(
            "Infant(s)",
            infants,
            () => setState(() => infants++),
            () => setState(() => infants--),
          ),
          _buildPassengerRow(
            "Extra Seat(s)",
            extraSeats,
            () => setState(() => extraSeats++),
            () => setState(() => extraSeats--),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              onPressed: () {
                // Return all selected counts
                Navigator.pop(context, {
                  "adults": adults,
                  "seniorCitizens": seniorCitizens,
                  "children": children,
                  "infants": infants,
                  "extraSeats": extraSeats,
                });
              },
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8)),
                ),
                backgroundColor: Colors.deepOrange,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Done",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
