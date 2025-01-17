import 'package:flutter/material.dart';

class PassengerSelectionScreen extends StatelessWidget {
  final int initialCount;
  const PassengerSelectionScreen({super.key, required this.initialCount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Passengers")),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // You can use a picker to select passenger count
            Navigator.pop(context, initialCount + 1); // Example increment
          },
          child: const Text("Select Passengers"),
        ),
      ),
    );
  }
}
