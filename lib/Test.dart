import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: DateTimeDisplay(),
        ),
      ),
    );
  }
}

class DateTimeDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatter = DateFormat('dd-MM-yyyy HH:mm:ss');
    String formattedDate = formatter.format(now);

    return Text(
      'Current Date and Time: $formattedDate',
      style: TextStyle(fontSize: 20),
    );
  }
}
