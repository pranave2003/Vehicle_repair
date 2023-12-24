import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Admin_add_Notification.dart';

class AdminNotification extends StatefulWidget {
  const AdminNotification({super.key});

  @override
  State<AdminNotification> createState() => _AdminNotificationState();
}

class _AdminNotificationState extends State<AdminNotification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8F1FF),
      appBar: AppBar(
        backgroundColor: Color(0xffE8F1FF),
        leading:
            CircleAvatar(backgroundImage: AssetImage("assets/officedp.jpg")),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10.sp),
            child: Container(
              height: 120.h,
              width: 100.w,
              color: Colors.white,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Heading",
                          style: TextStyle(fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: 350.w,
                          child: Text(
                              "Lorem ipsum is a placeholder text commonly used to "
                                  "demonstrate the visual form of a document or a typeface without relaying...")),
                    )
                  ],
                )
              ]),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child:Icon(Icons.add),
        onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) {
          return AdminAddNotification();
        },));},
      ),

    );
  }
}
