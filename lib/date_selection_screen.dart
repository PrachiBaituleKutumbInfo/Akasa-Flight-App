import 'package:flutter/material.dart';

class DepartureDateScreen extends StatefulWidget {
  @override
  _DepartureDateScreenState createState() => _DepartureDateScreenState();
}

class _DepartureDateScreenState extends State<DepartureDateScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Departure date"),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "₹ Lowest fare",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                for (int monthOffset = 0; monthOffset < 12; monthOffset++)
                  _buildMonthCalendar(
                      DateTime.now().add(Duration(days: 30 * monthOffset))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                  backgroundColor: Colors.deepOrange,
                ),
                onPressed: () {
                  Navigator.pop(context, selectedDate);
                },
                child: const Text(
                  "Done",
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthCalendar(DateTime month) {
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);

    final List<DateTime?> days = [];
    for (int i = 0; i < firstDayOfMonth.weekday - 1; i++) {
      days.add(null); // Empty cells before the start of the month
    }
    for (int i = 1; i <= daysInMonth; i++) {
      days.add(DateTime(month.year, month.month, i)); // Add valid dates
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            "${_monthName(month.month)} ${month.year}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Table(
          children: [
            TableRow(
              children: List.generate(
                7,
                (index) => Center(
                  child: Text(
                    ["M", "T", "W", "T", "F", "S", "S"][index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            ..._buildWeeks(days),
          ],
        ),
      ],
    );
  }

  List<TableRow> _buildWeeks(List<DateTime?> days) {
    final rows = <TableRow>[];
    for (int i = 0; i < days.length; i += 7) {
      rows.add(
        TableRow(
          children: List.generate(7, (index) {
            final day = i + index < days.length ? days[i + index] : null;
            return GestureDetector(
              onTap: day != null
                  ? () {
                      setState(() {
                        selectedDate = day;
                      });
                    }
                  : null,
              child: Container(
                margin: const EdgeInsets.all(4),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: day != null &&
                          day.day == selectedDate.day &&
                          day.month == selectedDate.month
                      ? Colors.deepOrange
                      : null,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(4),
                ),
                alignment: Alignment.center,
                child: Text(
                  day != null ? "${day.day}" : "",
                  style: TextStyle(
                    fontWeight: day != null &&
                            day.day == selectedDate.day &&
                            day.month == selectedDate.month
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: day != null ? Colors.black : Colors.transparent,
                  ),
                ),
              ),
            );
          }),
        ),
      );
    }
    return rows;
  }

  String _monthName(int month) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return months[month - 1];
  }
}


class ReturnDateScreen extends StatefulWidget {
  @override
  _ReturnDateScreenState createState() => _ReturnDateScreenState();
}

class _ReturnDateScreenState extends State<ReturnDateScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Return date"),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "₹ Lowest fare",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                for (int monthOffset = 0; monthOffset < 12; monthOffset++)
                  _buildMonthCalendar(
                      DateTime.now().add(Duration(days: 30 * monthOffset))),
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(15),
                  shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                  backgroundColor: Colors.deepOrange,
                ),
                onPressed: () {
                  Navigator.pop(context, selectedDate);
                },
                child: const Text(
                  "Done",
                  style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
            ),
          ),
           ),
        ],
      ),
    );
  }

  Widget _buildMonthCalendar(DateTime month) {
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);

    final List<DateTime?> days = [];
    for (int i = 0; i < firstDayOfMonth.weekday - 1; i++) {
      days.add(null); // Empty cells before the start of the month
    }
    for (int i = 1; i <= daysInMonth; i++) {
      days.add(DateTime(month.year, month.month, i)); // Add valid dates
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            "${_monthName(month.month)} ${month.year}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Table(
          children: [
            TableRow(
              children: List.generate(
                7,
                (index) => Center(
                  child: Text(
                    ["M", "T", "W", "T", "F", "S", "S"][index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            ..._buildWeeks(days),
          ],
        ),
      ],
    );
  }

  List<TableRow> _buildWeeks(List<DateTime?> days) {
    final rows = <TableRow>[];
    for (int i = 0; i < days.length; i += 7) {
      rows.add(
        TableRow(
          children: List.generate(7, (index) {
            final day = i + index < days.length ? days[i + index] : null;
            return GestureDetector(
              onTap: day != null
                  ? () {
                      setState(() {
                        selectedDate = day;
                      });
                    }
                  : null,
              child: Container(
                margin: const EdgeInsets.all(4),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: day != null &&
                          day.day == selectedDate.day &&
                          day.month == selectedDate.month
                      ? Colors.deepOrange
                      : null,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(4),
                ),
                alignment: Alignment.center,
                child: Text(
                  day != null ? "${day.day}" : "",
                  style: TextStyle(
                    fontWeight: day != null &&
                            day.day == selectedDate.day &&
                            day.month == selectedDate.month
                        ? FontWeight.bold
                        : FontWeight.normal,
                    color: day != null ? Colors.black : Colors.transparent,
                  ),
                ),
              ),
            );
          }),
        ),
      );
    }
    return rows;
  }

  String _monthName(int month) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
    return months[month - 1];
  }
}

