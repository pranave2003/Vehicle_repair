import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdminUser extends StatefulWidget {
  const AdminUser({super.key});

  @override
  State<AdminUser> createState() => _AdminUserState();
}

class _AdminUserState extends State<AdminUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE8F1FF),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Center(
              child: Container(
                width: 350.w,
                height: 800.h,
                color: Colors.white,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [IconButton(onPressed: () {
                        Navigator.of(context).pop();
                      }, icon: Icon(Icons.arrow_back_ios))],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 150.h,
                            width: 150.w,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/officedp.jpg"), fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(130),
                                color: Colors.grey),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Location",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 20),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.w, top: 20.h),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Username",
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
                                hintText: "  Username",
                                hintStyle: TextStyle(color: Colors.grey))),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Color(0xffE8F1FF)),
                      )
                    ],
                  ),
                  //   phone

                  Padding(
                    padding: EdgeInsets.only(left: 30.w, top: 20.h),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Phone number",
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
                                hintText: "  +91",
                                hintStyle: TextStyle(color: Colors.grey))),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Color(0xffE8F1FF)),
                      )
                    ],
                  ),
                  //   email

                  Padding(
                    padding: EdgeInsets.only(left: 30.w, top: 20.h),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "email address",
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Example@gmail.com",
                                  hintStyle: TextStyle(color: Colors.grey))),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Color(0xffE8F1FF)),
                      )
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.only(top: 130.h),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                              color: Color(0xff73ABFF),
                              borderRadius: BorderRadius.circular(5.sp)),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Accept",
                                style: TextStyle(color: Colors.white),
                              )),
                        ),
                        // second
                        Container(
                          width: 150.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                              color: Color(0xffFF9F9D),
                              borderRadius: BorderRadius.circular(5.sp)),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "reject",
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
