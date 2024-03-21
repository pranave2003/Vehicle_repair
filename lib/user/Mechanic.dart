import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_project/user/user_mechanic_detail%20page.dart';

class Mechanic extends StatefulWidget {
  const Mechanic({super.key});

  @override
  State<Mechanic> createState() => _MechanicState();
}

class _MechanicState extends State<Mechanic> {
  List<String> locationlist = [
    'Kasaragod',
    'Kannur',
    'Wayanad',
    'Kozhikode',
    'Malappuram',
    'palakkad'
        'Thrissur',
    'Ernakulam',
    'Idukki',
    'Kottayam',
    'Pathanamthitta',
    'Alappuzha',
    'Kollam',
    'Thiruvananthapuram',
  ];
  String? selectedvalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6).r,
            color: Colors.white,
          ),
          child: DropdownButton<String>(
              isExpanded: true,
              elevation: 0,
              dropdownColor: Colors.white,
              hint: const Text("Choose district"),
              underline: const SizedBox(),
              value: selectedvalue,
              items: locationlist.map((String value) {
                return DropdownMenuItem<String>(
                    value: value, child: Text(value));
              }).toList(),
              onChanged: (newvalue) {
                setState(() {
                  selectedvalue = newvalue;
                  print(selectedvalue);
                });
              },
              padding: const EdgeInsets.symmetric(horizontal: 10)),
        ),
      ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance
            .collection("mechsighn")
            .where("status", isEqualTo: 1)
            // .where("Location", isEqualTo: selectedvalue)
            .get(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("Error:${snapshot.error}"),
            );
          }
          final mech = snapshot.data?.docs ?? [];
          return Container(
            child: ListView.builder(
              itemCount: mech.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return Usermechanicdetailpage(
                            id: mech[index].id,
                          );
                        },
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffCFE2FF)),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        mech[index]['MechProfilrpath']),
                                  ),
                                  Text(mech[index]['username'])
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text("1+ year experience"),
                                  Text(mech[index]['Location']),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text("Available",
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
