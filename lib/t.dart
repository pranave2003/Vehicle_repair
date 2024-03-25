// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Tes extends StatefulWidget {
//   const Tes({super.key});
//
//   @override
//   State<Tes> createState() => _TesState();
// }
//
// class _TesState extends State<Tes> {
//   late List<String> _dropdownItems = ['Loading...']; // Initial dropdown items
//   late String _selectedItem;
//   @override
//   void initState() {
//     super.initState();
//     _fetchDataFromFirestore();
//   }
//
//   Future<void> _fetchDataFromFirestore() async {
//     try {
//       QuerySnapshot querySnapshot =
//           await FirebaseFirestore.instance.collection('Service').get();
//       List<String> items = querySnapshot.docs
//           .map((doc) => (doc.data() as Map<String, dynamic>)['av'] as String)
//           .toList();
//       setState(() {
//         _dropdownItems = items;
//         _selectedItem = _dropdownItems.first; // Set default selected item
//       });
//     } catch (e) {
//       print("Error fetching data: $e");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Dropdown from Firestore Collection'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             DropdownButton<String>(
//               value: _selectedItem,
//               onChanged: (newValue) {
//                 setState(() {
//                   _selectedItem = newValue!;
//                 });
//               },
//               items:
//                   _dropdownItems.map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DDD extends StatefulWidget {
  const DDD({super.key});

  @override
  State<DDD> createState() => _DDDState();
}

class _DDDState extends State<DDD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('Service').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<String> tradeList = snapshot.data!.docs
                      .map((DocumentSnapshot document) =>
                          document['Serviceinfo'].toString())
                      .toList();

                  return Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black54),
                          borderRadius: BorderRadius.circular(8)),
                      child: DropdownButton<String>(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 3),
                        underline: const SizedBox(),
                        borderRadius: BorderRadius.circular(10),
                        hint: const Text("Select Trade"),
                        value: selectedTrade,
                        // Set initial value if needed
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedTrade = newValue!;
                            print(selectedTrade);
                          });
                        },

                        items: tradeList
                            .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    ))
                            .toList(),
                      ),
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
      ]),
    );
  }

  String? selectedTrade;
}
