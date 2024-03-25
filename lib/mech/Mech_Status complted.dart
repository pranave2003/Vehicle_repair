// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'Mech_service_home.dart';
// import 'Mech_status_reject.dart';
// import 'mech_signup.dart';
//
// class MechStatusCompleated extends StatefulWidget {
//   const MechStatusCompleated({super.key, required this.id});
//   final id;
//
//   @override
//   State<MechStatusCompleated> createState() => _MechStatusCompleatedState();
// }
//
// class _MechStatusCompleatedState extends State<MechStatusCompleated> {
//   String gender = "";
//   final formkey = GlobalKey<FormState>();
//   DocumentSnapshot? complete;
//
//   getDtata() async {
//     complete = await FirebaseFirestore.instance
//         .collection('UserRequest')
//         .doc(widget.id)
//         .get();
//   }
//
//   // update status ==2 and update amount
//   update() {
//     FirebaseFirestore.instance
//         .collection('UserRequest')
//         .doc(widget.id)
//         .update({'status': 2, 'WorkCompleteAmount': amount.text});
//     Navigator.of(context).pop();
//     // setState(() {
//     //
//     // });
//   }
//
//   var a, b, c;
//   var amount = TextEditingController();
//   var reject = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: formkey,
//         child: SingleChildScrollView(
//           child: FutureBuilder(
//             future: getDtata(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return const Center(child: LinearProgressIndicator());
//               }
//               if (snapshot.hasError) {
//                 return Text("Error${snapshot.error}");
//               }
//               return Column(children: [
//                 SafeArea(
//                   child: Row(
//                     children: [
//                       IconButton(
//                           onPressed: () {
//                             Navigator.of(context).pop();
//                           },
//                           icon: Icon(Icons.arrow_back_ios)),
//                     ],
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Container(
//                       height: 120.h,
//                       width: 300.w,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           color: Color(0xffCFE2FF)),
//                       child: Column(children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.all(20),
//                               child: Column(
//                                 children: [
//                                   CircleAvatar(
//                                     radius: 30,
//                                     backgroundImage:
//                                         AssetImage("assets/dp.png"),
//                                   ),
//                                   Text(complete!["username"])
//                                 ],
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(20),
//                               child: Column(
//                                 children: [
//                                   Text(complete!["Work"]),
//                                   Text(complete!["Time"]),
//                                   Text(complete!["time"]),
//                                   Text(complete!["Location"]),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ]),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(30.sp),
//                   child: Row(
//                     children: [
//                       Text(
//                         "Add Status",
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w800),
//                       )
//                     ],
//                   ),
//                 ),
//                 Container(
//                   height: 150.h,
//                   width: double.infinity,
//                   child: Column(children: [
//                     RadioListTile(
//                         activeColor: Colors.blue,
//                         title: Text(
//                           "Completed",
//                           style: TextStyle(
//                               fontSize: 15.sp, fontWeight: FontWeight.w900),
//                         ),
//                         value: "b",
//                         groupValue: gender,
//                         onChanged: (value) {
//                           if (value == "b") {
//                             a = 1;
//                           }
//                           setState(() {
//                             print(value);
//                             gender = value.toString();
//                           });
//                         }),
//                     RadioListTile(
//                         activeColor: Colors.blue,
//                         title: Text("Not completed",
//                             style: TextStyle(
//                                 fontSize: 15.sp, fontWeight: FontWeight.w900)),
//                         value: "f",
//                         groupValue: gender,
//                         onChanged: (value) {
//                           print(value);
//                           if (value == "f") {
//                             a = 2;
//                           }
//                           gender = value.toString();
//                           setState(() {});
//                         }),
//                   ]),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: a == 1
//                       ? Column(
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.all(30.sp),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     "Amount",
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.green),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                     width: 200.w,
//                                     height: 50.h,
//                                     decoration: BoxDecoration(
//                                         border: Border.all(width: 1),
//                                         borderRadius:
//                                             BorderRadius.circular(15)),
//                                     child: TextFormField(
//                                       validator: (value) {
//                                         if (value!.isEmpty) {
//                                           return 'empty experience';
//                                         }
//                                       },
//                                       controller: amount,
//                                       decoration: InputDecoration(
//                                           hintText: "  Enter amount",
//                                           border: InputBorder.none),
//                                     ))
//                               ],
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(
//                                 top: 50.h,
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                       width: 200.w,
//                                       height: 50.h,
//                                       decoration: BoxDecoration(
//                                           color: Colors.blue.shade800,
//                                           border: Border.all(width: 1),
//                                           borderRadius:
//                                               BorderRadius.circular(15)),
//                                       child: Center(
//                                           child: TextButton(
//                                               onPressed: () {
//                                                 if (formkey.currentState!
//                                                     .validate()) {}
//                                                 update();
//                                               },
//                                               child: Text(
//                                                 "Submit amount",
//                                                 style: TextStyle(
//                                                     color: Colors.white),
//                                               ))))
//                                 ],
//                               ),
//                             )
//                           ],
//                         )
//                       : Column(
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.all(30.sp),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     "Reject reason",
//                                     style: TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.red),
//                                   )
//                                 ],
//                               ),
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   width: 300.w,
//                                   height: 200.h,
//                                   decoration: BoxDecoration(
//                                       border: Border.all(width: 1),
//                                       borderRadius: BorderRadius.circular(15)),
//                                   child: TextFormField(
//                                     controller: reject,
//                                     maxLines: 10,
//                                     decoration: InputDecoration(
//                                         border: InputBorder.none),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(
//                                 top: 50.h,
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                       width: 200.w,
//                                       height: 50.h,
//                                       decoration: BoxDecoration(
//                                           color: Colors.blue.shade800,
//                                           border: Border.all(width: 1),
//                                           borderRadius:
//                                               BorderRadius.circular(15)),
//                                       child: Center(
//                                           child: TextButton(
//                                               onPressed: () {},
//                                               child: Text(
//                                                 "Submit",
//                                                 style: TextStyle(
//                                                     color: Colors.white),
//                                               ))))
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                 ),
//               ]);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Mech_service_home.dart';
import 'Mech_status_reject.dart';
import 'mech_signup.dart';

class MechStatusCompleated extends StatefulWidget {
  const MechStatusCompleated({super.key, required this.id});
  final id;

  @override
  State<MechStatusCompleated> createState() => _MechStatusCompleatedState();
}

class _MechStatusCompleatedState extends State<MechStatusCompleated> {
  String gender = "";
  final formkey = GlobalKey<FormState>();
  DocumentSnapshot? complete;

  getDtata() async {
    print("Get data");
    complete = await FirebaseFirestore.instance
        .collection('UserRequest')
        .doc(widget.id)
        .get();
  }

  // update status ==2 and update amount

  // void initState() {
  //   getDtata();
  // }

  update() {
    FirebaseFirestore.instance
        .collection('UserRequest')
        .doc(widget.id)
        .update({'payment': "3", 'WorkCompleteAmount': amount.text});
    Navigator.of(context).pop();
  }

  rejectupdate() {
    FirebaseFirestore.instance
        .collection('UserRequest')
        .doc(widget.id)
        .update({'payment': "4", 'WorkReject': reject.text});
    Navigator.of(context).pop();
  }

  var a;
  var amount = TextEditingController();
  var reject = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getDtata(),
      builder: (context, snapshot) {
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return LinearProgressIndicator(
        //     color: Colors.red,
        //   );
        // }
        if (snapshot.hasError) {
          return Center(
            child: Text("Error:${snapshot.error}"),
          );
        }
        return Scaffold(
          body: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(children: [
                SafeArea(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back_ios)),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 140.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffCFE2FF)),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        AssetImage("assets/dp.png"),
                                  ),
                                  Text(complete?["username"] ?? "----")
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                children: [
                                  Text(complete?["Work"] ?? "----"),
                                  Text(complete?["Time"] ?? "----"),
                                  Text(complete?["time"] ?? "----"),
                                  Text(complete?["Location"] ?? "---"),
                                ],
                              ),
                            )
                          ],
                        ),
                      ]),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(30.sp),
                  child: Row(
                    children: [
                      Text(
                        "Choose your option",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 150.h,
                  width: double.infinity,
                  child: Column(children: [
                    RadioListTile(
                        activeColor: Colors.blue,
                        title: Text(
                          "Completed",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w900),
                        ),
                        value: "b",
                        groupValue: gender,
                        onChanged: (value) {
                          if (value == "b") {
                            a = 1;
                          }
                          setState(() {
                            print(value);
                            gender = value.toString();
                          });
                        }),
                    RadioListTile(
                        activeColor: Colors.blue,
                        title: Text("Not completed",
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w900)),
                        value: "f",
                        groupValue: gender,
                        onChanged: (value) {
                          print(value);
                          if (value == "f") {
                            a = 2;
                          }
                          gender = value.toString();
                          setState(() {});
                        }),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: a == 1
                      ? Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(30.sp),
                              child: Row(
                                children: [
                                  Text(
                                    "Amount",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.green),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: 200.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 1),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'empty experience';
                                        }
                                      },
                                      controller: amount,
                                      decoration: InputDecoration(
                                          hintText: "  Enter amount",
                                          border: InputBorder.none),
                                    ))
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 50.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 200.w,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                          color: Colors.blue.shade800,
                                          border: Border.all(width: 1),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                          child: TextButton(
                                              onPressed: () {
                                                if (formkey.currentState!
                                                    .validate()) {}
                                                update();
                                              },
                                              child: Text(
                                                "Submit amount",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))))
                                ],
                              ),
                            )
                          ],
                        )
                      : Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(30.sp),
                              child: Row(
                                children: [
                                  Text(
                                    "Reject reason",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 300.w,
                                  height: 200.h,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 1),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: TextFormField(
                                    controller: reject,
                                    maxLines: 10,
                                    decoration: InputDecoration(
                                        border: InputBorder.none),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: 50.h,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      width: 200.w,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                          color: Colors.blue.shade800,
                                          border: Border.all(width: 1),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Center(
                                          child: TextButton(
                                              onPressed: () {
                                                rejectupdate();
                                              },
                                              child: Text(
                                                "Submit",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ))))
                                ],
                              ),
                            )
                          ],
                        ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
