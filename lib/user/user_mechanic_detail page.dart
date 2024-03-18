// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'Requests.dart';
//
// class Usermechanicdetailpage extends StatefulWidget {
//   const Usermechanicdetailpage({super.key, required this.id});
//   final id;
//
//   @override
//   State<Usermechanicdetailpage> createState() => _UsermechanicdetailpageState();
// }
//
// class _UsermechanicdetailpageState extends State<Usermechanicdetailpage> {
//   DocumentSnapshot? mechs;
//   var work;
//
//   getDtata() async {
//     mechs = await FirebaseFirestore.instance
//         .collection('mechsighn')
//         .doc(widget.id)
//         .get();
//   }
//
//   void initState() {
//     super.initState();
//     getData();
//   }
//
//   List<String> Worklist = [
//     'oil chang',
//     'engine service',
//     'brake down',
//   ];
//   String? selectedvalue;
//   var place = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           automaticallyImplyLeading: false,
//           backgroundColor: Color(0xffCFE2FF),
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   icon: Icon(Icons.arrow_back_ios)),
//               Text("Needed service"),
//               SizedBox()
//             ],
//           )),
//       body: FutureBuilder(
//         future: getDtata(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Text("Error${snapshot.error}");
//           }
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Column(
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(top: 40.h),
//                           child: Container(
//                             height: 100.h,
//                             width: 100.w,
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     image:
//                                         NetworkImage(mechs!['MechProfilrpath']),
//                                     fit: BoxFit.fill),
//                                 borderRadius: BorderRadius.circular(60),
//                                 color: Colors.grey),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(mechs!['username'],
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w600, fontSize: 18)),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             mechs!['Phonenumber'],
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             mechs!['experience'],
//                             style: TextStyle(
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           width: 100.w,
//                           height: 30.h,
//                           child: Center(
//                               child: Text("Available",
//                                   style: TextStyle(color: Colors.white))),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: Colors.green),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Row(
//                     children: [
//                       Text("Add needed service"),
//                     ],
//                   ),
//                 ),
//
//                 Container(
//                   width: 290.w,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(6).r,
//                     color: Color(0xffCFE2FF),
//                   ),
//                   child: DropdownButton<String>(
//                       isExpanded: true,
//                       elevation: 0,
//                       dropdownColor: Colors.white,
//                       hint: const Text("Choose needed service"),
//                       underline: const SizedBox(),
//                       value: selectedvalue,
//                       items: Worklist.map((String value) {
//                         return DropdownMenuItem<String>(
//                             value: value, child: Text(value));
//                       }).toList(),
//                       onChanged: (newvalue) {
//                         setState(() {
//                           selectedvalue = newvalue;
//                           print(selectedvalue);
//                         });
//                       },
//                       padding: const EdgeInsets.symmetric(horizontal: 10)),
//                 ),
//
//                 //
//                 Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Row(
//                     children: [
//                       Text("Place"),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                         width: 290,
//                         child: TextFormField(
//                           controller: place,
//                           decoration: InputDecoration(
//                               hintText: "Enter your place",
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(
//                                 20,
//                               ))),
//                         ))
//                   ],
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 100.sp),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: 180.w,
//                         height: 50.h,
//                         child: TextButton(
//                             onPressed: () {
//                               requast();
//                             },
//                             child: Center(
//                               child: Text(
//                                 "Request",
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                             )),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: Colors.blue.shade900),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Future<dynamic> requast() async {
//     print('object');
//     await FirebaseFirestore.instance.collection('UserRequest').add({
//       // 'id':widget.id,
//       "Work": selectedvalue,
//       "Location": place.text,
//       "mechid": widget.id,
//       "username": nm,
//       "Userid": ID,
//       "mechname": mechs!['username'],
//       "Mechprofilepath": mechs!['MechProfilrpath'],
//       "UserProfile": path,
//       "Time": DateFormat('dd/mm/yy').format(date),
//       "time": time.format(context),
//       "status": 0,
//       "usermob": number
//     }).then((value) {
//       Navigator.of(context).pop();
//       print("Request success");
//     });
//   }
//
//   Future<void> getData() async {
//     SharedPreferences spref = await SharedPreferences.getInstance();
//     setState(() {
//       nm = spref.getString("name");
//       path = spref.getString("paath");
//       number = spref.getString("phone");
//
//       ID = spref.getString("id");
//
//       spref.setString("name", nm);
//       spref.setString("Paath", path);
//       spref.setString("phone", number);
//
//       spref.setString("id", ID);
//
//       print(nm.toString());
//     });
//     print("Updated");
//   }
//
//   var nm;
//   var ID;
//   var path;
//   var number;
//   final date = new DateTime.now();
//   TimeOfDay time = TimeOfDay.now();
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Requests.dart';

class Usermechanicdetailpage extends StatefulWidget {
  const Usermechanicdetailpage({Key? key, required this.id}) : super(key: key);
  final id;

  @override
  State<Usermechanicdetailpage> createState() => _UsermechanicdetailpageState();
}

class _UsermechanicdetailpageState extends State<Usermechanicdetailpage> {
  DocumentSnapshot? mechs;
  var work;

  // ServiceList() {
  //   work = FirebaseFirestore.instance.collection("Service").get();
  // }

  GetDtata() async {
    mechs = await FirebaseFirestore.instance
        .collection('mechsighn')
        .doc(widget.id)
        .get();
  }

  @override
  // void initState() {
  //   super.initState();
  //   GetDtata();
  // }

  List<String> Worklist = [
    'oil change',
    'engine service',
    'brake down',
  ];
  String? selectedvalue;
  var place = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffCFE2FF),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios)),
            Text("Needed service"),
            SizedBox()
          ],
        ),
      ),
      body: FutureBuilder(
        future: GetDtata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text("Error${snapshot.error}");
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 40.h),
                          child: Container(
                            height: 100.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        NetworkImage(mechs!['MechProfilrpath']),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(60),
                                color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(mechs!['username'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            mechs!['Phonenumber'],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            mechs!['experience'],
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          width: 100.w,
                          height: 30.h,
                          child: Center(
                              child: Text("Available",
                                  style: TextStyle(color: Colors.white))),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text("Add needed service"),
                    ],
                  ),
                ),
                Container(
                  width: 290.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6).r,
                    color: Color(0xffCFE2FF),
                  ),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    elevation: 0,
                    dropdownColor: Colors.white,
                    hint: const Text("Choose needed service"),
                    underline: const SizedBox(),
                    value: selectedvalue,
                    items: Worklist.map((String value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text(value));
                    }).toList(),
                    onChanged: (newvalue) {
                      setState(() {
                        selectedvalue = newvalue;
                        print(selectedvalue);
                      });
                    },
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Text("Place"),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 290,
                      child: TextFormField(
                        controller: place,
                        decoration: InputDecoration(
                            hintText: "Enter your place",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                              20,
                            ))),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 100.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 180.w,
                        height: 50.h,
                        child: TextButton(
                          onPressed: () {
                            requast();
                          },
                          child: Center(
                            child: Text(
                              "Request",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue.shade900),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> requast() async {
    print('object');
    await FirebaseFirestore.instance.collection('UserRequest').add({
      "Work": selectedvalue,
      "Location": place.text,
      "mechid": widget.id,
      "username": nm,
      "Userid": ID,
      "mechname": mechs!['username'],
      "Mechprofilepath": mechs!['MechProfilrpath'],
      "UserProfile": path,
      "Time": DateFormat('dd/MM/yyyy').format(date),
      // Changed 'dd/mm/yy' to 'dd/MM/yyyy'
      "time": "${time.hour}:${time.minute}",
      // Changed 'time.format(context)' to '${time.hour}:${time.minute}'
      "status": 0,
      "usermob": number
    }).then((value) {
      Navigator.of(context).pop();
      print("Request success");
    });
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      nm = spref.getString("name");
      path = spref.getString("paath");
      number = spref.getString("phone");

      ID = spref.getString("id");

      spref.setString("name", nm);
      spref.setString("paath", path); // Changed 'Paath' to 'paath'
      spref.setString("phone", number);

      spref.setString("id", ID);

      print(nm.toString());
    });
    print("Updated");
  }

  var nm;
  var ID;
  var path;
  var number;
  final date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
}
