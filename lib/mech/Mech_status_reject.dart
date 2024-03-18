import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Mech_Status complted.dart';

class MechStatusReject extends StatefulWidget {
  const MechStatusReject({super.key});

  @override
  State<MechStatusReject> createState() => _MechStatusRejectState();
}

class _MechStatusRejectState extends State<MechStatusReject> {
  String gender = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
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
          height: 130.h,
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
                    gender = value.toString();
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => MechStatusCompleated(),
                    //     ));
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
                  setState(() {
                    gender = value.toString();
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
                    "Reject reason",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                    maxLines: 10,
                    decoration: InputDecoration(border: InputBorder.none),
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
          ],
        ),

      ]),
    );
  }
}
