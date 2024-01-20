import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Mech_rating.dart';
import 'Mech_service.dart';
import 'mech Request.dart';

class MechServiceHome extends StatefulWidget {
  const MechServiceHome({super.key});

  @override
  State<MechServiceHome> createState() => _MechServiceHomeState();
}

class _MechServiceHomeState extends State<MechServiceHome> {
  int indexNum = 0;
  List page = [Request(), MechService(), MechRating()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexNum,
        selectedIconTheme: IconThemeData(color: Colors.blue),
        onTap: (int Index) {
          setState(() {
            indexNum = Index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.manage_accounts), label: 'Request'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Service'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Rating'),
        ],
      ),
      body: page[indexNum],
    );
  }
}
