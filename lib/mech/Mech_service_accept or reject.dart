import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MechServiceAccept extends StatefulWidget {
  const MechServiceAccept({super.key});

  @override
  State<MechServiceAccept> createState() => _MechServiceAcceptState();
}

class _MechServiceAcceptState extends State<MechServiceAccept> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SafeArea(
            child:
                IconButton(onPressed: () {Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back_ios))),
        Center(
          child: Container(
            width: 330.w,
            height: 600.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffCFE2FF)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 80.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  CircleAvatar(
                      backgroundImage: AssetImage("assets/officedp.jpg"),
                      radius: 40.sp),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Name", style: TextStyle(fontSize: 18)),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 250.h, left: 90.w),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(width: 100, child: Text("Problem",style: TextStyle(fontSize: 18),)),
                    SizedBox(
                      width: 10,
                      child: Text(":"),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text("Fuel leaking",style: TextStyle(fontSize: 18)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(width: 100, child: Text("Place",style: TextStyle(fontSize: 18),)),
                    SizedBox(
                      width: 10,
                      child: Text(":"),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text("Kozhikode beach road",style: TextStyle(fontSize: 18)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(width: 100, child: Text("Date",style: TextStyle(fontSize: 18),)),
                    SizedBox(
                      width: 10,
                      child: Text(":"),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text(" 12/05/2023",style: TextStyle(fontSize: 18)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(width: 100, child: Text("Time",style: TextStyle(fontSize: 18),)),
                    SizedBox(
                      width: 10,
                      child: Text(":"),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text("10:00 am",style: TextStyle(fontSize: 18)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(width: 100, child: Text("Contact number",style: TextStyle(fontSize: 18),)),
                    SizedBox(
                      width: 10,
                      child: Text(":"),
                    ),
                    SizedBox(
                      width: 100,
                      child: Text("000000000",style: TextStyle(fontSize: 18)),
                    )
                  ],
                ),
              ),

              Padding(
                padding:  EdgeInsets.only(top: 100.h),
                child: Row(
                  children: [
                    Container(
                      height: 40.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green,
                      ),
                      child: Center(
                        child: TextButton(onPressed: (() {

                        }), child: Text("Accept",style: TextStyle(color: Colors.white),))
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Container(
                      height: 40.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.red,
                      ),
                      child: Center(
                          child: TextButton(onPressed: (() {

                          }), child: Text("Reject",style: TextStyle(color: Colors.white),))
                      ),
                    ),
                  ],
                ),
              )

            ],
          ),
        ),

      ]),
    );
  }
}
