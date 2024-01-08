import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Userlogin extends StatefulWidget {
  const Userlogin({super.key});

  @override
  State<Userlogin> createState() => _UserloginState();
}

class _UserloginState extends State<Userlogin> {
  var username = TextEditingController();
  var password = TextEditingController();

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
                      "LOGIN",
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
                          controller: username,
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
                          controller: password,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.only(right: 45.w),
                        child: Text(
                          "Forgot password ?",
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 15.sp,
                          ),
                        ),
                      ))
                ],
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
                          onPressed: () {},
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do you have account ?"),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Colors.blueAccent),
                        ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
