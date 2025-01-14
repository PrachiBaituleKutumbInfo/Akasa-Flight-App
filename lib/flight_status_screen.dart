import 'package:flutter/material.dart';

class FlightStatusScreen extends StatelessWidget {
  const FlightStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flight Status')),
      body: const Center(child: Text('Flight Status Screen')),
    );
  }
}