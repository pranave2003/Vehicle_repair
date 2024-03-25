import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late List<String> _dropdownItems = ['Loading...']; // Initial dropdown items
  late String _selectedItem;

  @override
  void initState() {
    super.initState();
    _fetchDataFromFirestore();
  }

  // Future<void> _fetchDataFromFirestore() async {
  //   try {
  //     QuerySnapshot querySnapshot =
  //         await FirebaseFirestore.instance.collection('your_collection').get();
  //     List<String> items = querySnapshot.docs
  //         .map((doc) => doc.data()['your_field'] as String)
  //         .toList();
  //     setState(() {
  //       _dropdownItems = items;
  //       _selectedItem = _dropdownItems.first; // Set default selected item
  //     });
  //   } catch (e) {
  //     print("Error fetching data: $e");
  //   }
  // }
  Future<void> _fetchDataFromFirestore() async {
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('Service').get();
      List<String> items = querySnapshot.docs
          .map((doc) =>
              (doc.data() as Map<String, dynamic>)['Serviceinfo'] as String)
          .toList();
      setState(() {
        _dropdownItems = items;
        _selectedItem = _dropdownItems.first; // Set default selected item
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dropdown from Firestore Collection'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: _selectedItem,
              onChanged: (newValue) {
                setState(() {
                  _selectedItem = newValue!;
                });
              },
              items:
                  _dropdownItems.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
