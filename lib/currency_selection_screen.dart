import 'package:flutter/material.dart';

class CurrencySelectionScreen extends StatelessWidget {
  final String selectedCurrency;
  const CurrencySelectionScreen({super.key, required this.selectedCurrency});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Currency")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Indian Rupee"),
            onTap: () {
              Navigator.pop(context, "Indian Rupee");
            },
          ),
          ListTile(
            title: const Text("USD"),
            onTap: () {
              Navigator.pop(context, "USD");
            },
          ),
          ListTile(
            title: const Text("Euro"),
            onTap: () {
              Navigator.pop(context, "Euro");
            },
          ),
        ],
      ),
    );
  }
}
