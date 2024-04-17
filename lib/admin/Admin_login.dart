

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Admin_home_User.dart';

class Adminlogin extends StatefulWidget {
  const Adminlogin({super.key});

  @override
  State<Adminlogin> createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {
  var Name = TextEditingController();
  var Pass = TextEditingController();
  login() {
    if (Name.text == 'admin@gmail.com' && Pass.text == '123') {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return AdminHomeuser();
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffCFE2FF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.h),
                child: SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 140.h,
                        width: 140.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/tow 3.png"),
                                fit: BoxFit.fill)),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      20,
                    ),
                    child: Text(
                      "ADMIN LOGIN",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.w),
                child: Row(
                  children: [
                    Text(
                      "Enter username",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 290.w,
                      height: 50.h,
                      child: TextFormField(
                          controller: Name,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "  Username",
                              hintStyle: TextStyle(color: Colors.grey))),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50.w, top: 30.h),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Enter Password",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 290.w,
                      height: 50.h,
                      child: TextFormField(
                          controller: Pass,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "  Enter Password",
                              hintStyle: TextStyle(color: Colors.grey))),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 90.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 190.w,
                      height: 50.h,
                      child: TextButton(
                          onPressed: () {
                            login();
                          },
                          child: Text(
                            "LOGIN",
                            style: TextStyle(color: Colors.white),
                          )),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: Color(0xff2357D9)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
