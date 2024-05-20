import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'Admin_Notification.dart';
import 'Admin_home_User.dart';

class AdminAddNotification extends StatefulWidget {
  const AdminAddNotification({super.key});

  @override
  State<AdminAddNotification> createState() => _AdminAddNotificationState();
}

class _AdminAddNotificationState extends State<AdminAddNotification> {
  var Matter = TextEditingController();
  var Content = TextEditingController();



  final date = new DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  Future<dynamic> notification() async {
    setState(() {
      print('gooooooooooo///////////');
      FirebaseFirestore.instance.collection("Notification").add({
        "matter": Matter.text,
        "content": Content.text,
        'Time': time.format(context),
        'date': DateFormat('dd/MM/yyyy').format(date)
      });
      Navigator.of(context).pop();
    });
    Matter.clear();
    Content.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8F1FF),
      body: SingleChildScrollView(
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
          Padding(
            padding: EdgeInsets.only(left: 50.w, bottom: 10),
            child: Row(
              children: [
                Text(
                  "Enter Matter",
                  style: TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50.h,
                width: 330.w,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: Matter,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "   Matter",
                          hintStyle: TextStyle(color: Colors.grey))),
                ),
              )
            ],
          ),
          //   content
          Padding(
            padding: EdgeInsets.only(left: 50.w, bottom: 10.h, top: 50.h),
            child: Row(
              children: [
                Text(
                  "Enter Content",
                  style: TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Container(
            height: 500.h,
            width: 330.w,
            color: Colors.white,
            child: TextFormField(
                controller: Content,
                maxLines: 10,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "   Content.....",
                    hintStyle: TextStyle(color: Colors.grey))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Container(
                  width: 200.w,
                  height: 50.h,
                  child: Center(
                      child: TextButton(
                          onPressed: () {
                            notification();
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(color: Colors.white),
                          ))),
                  decoration: BoxDecoration(
                      color: Color(0xff2357D9),
                      borderRadius: BorderRadius.circular(20)),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
