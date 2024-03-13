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
  var complete;
  getDtata() async {
    complete = await FirebaseFirestore.instance
        .collection('User')
        .doc(widget.id)
        .get();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future:getDtata() ,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text("Error${snapshot.error}");
            }
            return Column(children: [
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
                    height: 120.h,
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
                                  backgroundImage: AssetImage("assets/dp.png"),
                                ),
                                Text("Name")
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                Text("Fuel leaking"),
                                Text("Data"),
                                Text("Time"),
                                Text("Place"),
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
                      "Add Status",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
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
                        style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w900),
                      ),
                      value: "complete",
                      groupValue: gender,
                      onChanged: (value) {
                        setState(() {
                          if(value==complete){}
                          print(value);
                          gender = value.toString();
                        });
                      }),
                  RadioListTile(
                      activeColor: Colors.blue,
                      title: Text("Not completed",
                          style: TextStyle(
                              fontSize: 15.sp, fontWeight: FontWeight.w900)),
                      value: "notcomplete",
                      groupValue: gender,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          gender = value.toString();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MechStatusReject(),
                              ));
                        });
                      }),
                ]),
              ),

              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(30.sp),
                    child: Row(
                      children: [
                        Text(
                          "Amount",
                          style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                              borderRadius: BorderRadius.circular(15)),
                          child: TextFormField(
                            decoration: InputDecoration(
                                hintText: "Enter amount", border: InputBorder.none),
                          ))
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 150.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 200.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade800,
                            border: Border.all(width: 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Submit",
                                  style: TextStyle(color: Colors.white),
                                ))))
                  ],
                ),
              )
            ]);
          },
        ),
      ),
    );
  }
}
