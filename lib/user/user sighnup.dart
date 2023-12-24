import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserSighnup extends StatefulWidget {
  const UserSighnup({super.key});

  @override
  State<UserSighnup> createState() => _UserSighnupState();
}

class _UserSighnupState extends State<UserSighnup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffCFE2FF),
        body: ListView(
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
                    "SIGN UP",
                    style:
                    TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 50.w,bottom: 10.h),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 290.w,
                  height: 50.h,
                  child: TextFormField(
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
            // phone
            Padding(
              padding: EdgeInsets.only(left: 50.w,),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Enter Phone number",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 290.w,
                  height: 50.h,
                  child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "  Phone number",
                          hintStyle: TextStyle(color: Colors.grey))),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: Colors.white),
                )
              ],
            ),
            //email
            Padding(
              padding: EdgeInsets.only(left: 50.w,),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Enter Your email",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 290.w,
                  height: 50.h,
                  child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "  Enter email",
                          hintStyle: TextStyle(color: Colors.grey))),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: Colors.white),
                )
              ],
            ),
            //pass
            Padding(
              padding: EdgeInsets.only(left: 50.w,),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Enter your Password",
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 290.w,
                  height: 50.h,
                  child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "  Enter your Password",
                          hintStyle: TextStyle(color: Colors.grey))),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.sp),
                      color: Colors.white),
                )
              ],
            ),
            // login
            Padding(
              padding: EdgeInsets.only(top:50.h,bottom: 20.h),
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

          ],
        ));
  }
}
