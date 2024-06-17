import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Mechanical_list.dart';
import 'User_list.dart';

class HOME extends StatefulWidget {
  const HOME({super.key});

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
                child: CircleAvatar(
                    backgroundImage: AssetImage("assets/officedp.jpg"))),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20).r,
              child: Container(
                height: 50.h,
                // width: 330.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.white),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Color(0xff6EA3F3),
                  ),
                  tabs: [
                    Tab(
                        child: Text(
                      'User',
                      style: TextStyle(
                        // color: Colors.white,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.h,
                      ),
                    )),
                    Tab(
                        child: Text(
                      'Mechanic',
                      style: TextStyle(
                        // color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.h,
                      ),
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            Expanded(
              child: TabBarView(children: [UserList(), MechanicalList()]),
            )
          ],
        ),
      ),
    );
  }
}
