import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Mechanic.dart';
import 'Requests.dart';
import 'User_notification.dart';
import 'User_profile.dart';

class UserMechanicList extends StatefulWidget {
  const UserMechanicList({super.key});

  @override
  State<UserMechanicList> createState() => _UserMechanicListState();
}

class _UserMechanicListState extends State<UserMechanicList> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xffCFE2FF),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return UserProfile();
                  },));
                },child: CircleAvatar(backgroundImage: AssetImage("assets/bMan.png"))),
                Container(
                  height: 40.h,
                  width: 250.w,
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.search),
                    ),
                    SizedBox(
                        width: 200.w,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Search"),
                        ))
                  ]),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                ),
                IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return UserNotification();
                },));}, icon: Icon(Icons.notification_add))
              ],
            )),

        bottomNavigationBar: BottomAppBar(color: Colors.white,child:  Padding(
          padding: const EdgeInsets.only(left: 10, right: 10,top: 20).r,
          child: Container(
            height: 50.h,
            // width: 330.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Color(0xffE8F1FF)),
            child: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Colors.blue.shade900,
              ),
              tabs: [
                Tab(
                    child: Text(
                      'Mechanic',
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
                      'Request',
                      style: TextStyle(
                        // color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.h,
                      ),
                    )),

              ],

            ),
          ),
        ),
              ),
body: Container(child:  TabBarView(children: [
  Mechanic(),
  Requests()

])),

      ),
    );
  }
}
