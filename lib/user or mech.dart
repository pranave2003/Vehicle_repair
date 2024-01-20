import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vehicle_project/user/User_login.dart';

import 'admin/Admin_login.dart';
import 'mech/mech login.dart';
import 'mech/mech_signup.dart';

class Userormech extends StatefulWidget {
  const Userormech({super.key});

  @override
  State<Userormech> createState() => _UserormechState();
}

class _UserormechState extends State<Userormech> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffCFE2FF),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(
                      20,
                    ),
                    child: Text(
                      "Who are you",
                      style: TextStyle(fontWeight: FontWeight.w800),
                    ),
                  )
                ],
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
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Mechlogin();
                              },
                            ));
                          },
                          readOnly: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "  Mechanic",
                              hintStyle: TextStyle(color: Colors.white))),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: Color(0xff2357D9)),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 290.w,
                      height: 50.h,
                      child: TextFormField(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Userlogin();
                              },
                            ));
                          },
                          readOnly: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "  User",
                              hintStyle: TextStyle())),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return Adminlogin();
                          },
                        ));
                      },
                      child: Text(
                        "Admin Login",
                        style: TextStyle(
                          color: Color(0xff2357D9),
                          fontSize: 20.sp,
                        ),
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 250.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 190.w,
                      height: 50.h,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "CONTINUE",
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
