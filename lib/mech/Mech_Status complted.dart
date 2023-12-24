import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MechStatusCompleated extends StatefulWidget {
  const MechStatusCompleated({super.key});

  @override
  State<MechStatusCompleated> createState() => _MechStatusCompleatedState();
}

class _MechStatusCompleatedState extends State<MechStatusCompleated> {
  String gender = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SafeArea(
          child: Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
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
                value: "user",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                }),
            RadioListTile(
                activeColor: Colors.blue,
                title: Text("Not completed",
                    style: TextStyle(
                        fontSize: 15.sp, fontWeight: FontWeight.w900)),
                value: "Event",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                }),
          ]),
        ),
        Padding(
          padding: EdgeInsets.all(30.sp),
          child: Row(
            children: [
              Text(
                "Amount",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
              child: Center(
                child: Text(" \$2000 /-",
                    style:
                        TextStyle(fontWeight: FontWeight.w900, fontSize: 20)),
              ),
            )
          ],
        ),
        Padding(
          padding:  EdgeInsets.only(top: 150.h),
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
      ]),
    );
  }
}
